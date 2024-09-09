import 'dart:math';
import 'package:accounts_protector/core/events/events.dart';
import 'package:accounts_protector/core/models/account_attribute.dart';
import 'package:accounts_protector/core/services/encryption_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../core/failures/i_failure.dart';
import '../../../core/models/account.dart';
import '../data/i_accounts_repo.dart';
import '../data/text_controller_attribute.dart';
part 'account_crud_state.dart';

class AccountCrudCubit extends Cubit<AccountCrudState> {
  final IAccountsRepo _accountsRepo;
  final TextEditingController accountNameController = TextEditingController();
  List<TextControllerAttribute> controllers = [TextControllerAttribute()];
  late Account account;
  int platformId = 0;
  AccountCrudCubit(this._accountsRepo) : super(AccountsInitial());

  void setAccount(Account account) {
    this.account = account;
  }

  void setPlatformId(int platformId) {
    this.platformId = platformId;
  }
  Future<void> createAccount() async {
    emit(AccountLoadingState());
    final Account newAccount = Account(
      accountName: accountNameController.text,
      platformId: platformId,
      accountAttributes: getAttributesMapFromControllers(),
    );
    try {
      await _accountsRepo.createAccount(newAccount);
      emit(CreateAccountSuccess());
      eventBus.fire(RefreshPlatformEvent());
      eventBus.fire(RefreshHomeEvent());
    } catch (e) {
      if (e is Failure) {
        emit(FailedState(e.message));
      } else {
        emit(const FailedState('Something went wrong'));
      }
    }
  }

  Future<void> deleteAccount() async {
    emit(AccountLoadingState());
    try {
      await _accountsRepo.deleteAccount(account);
      emit(AccountDeletedState(account.accountId!));
      eventBus.fire(RefreshPlatformEvent());
      eventBus.fire(RefreshHomeEvent());
    } catch (e) {
      if (e is Failure) {
        emit(FailedState(e.message));
      } else {
        emit(const FailedState('Something went wrong'));
      }
    }
  }

  Future<void> updateAccount() async {
    emit(AccountLoadingState());
    final Account updatedAccount = Account(
      accountId: account.accountId,
      accountName: accountNameController.text,
      platformId: account.platformId,
      accountAttributes: getAttributesMapFromControllers(),
    );
    try {
      await _accountsRepo.updateAccount(updatedAccount);
      emit(AccountUpdatedState());
      eventBus.fire(RefreshAccountEvent());
      eventBus.fire(RefreshPlatformEvent());
      // resetInputFields();
    } catch (e) {
      if (e is Failure) {
        emit(FailedState(e.message));
      } else {
        emit(const FailedState('Something went wrong'));
      }
    }
  }

  @override
  Future<void> close() {
    accountNameController.dispose();
    for (var element in controllers) {
      element.key.dispose();
      element.value.dispose();
    }
    return super.close();
  }

  // ************************************************** utils **************************************************

  void onTextFieldChanged(int index, String text) {
    if (index == controllers.length - 1 && text.isNotEmpty) {
      controllers.add(TextControllerAttribute());
      emit(TextFieldCreated(controllers, controllers.length));
    } else if (controllers[index].key.text.isEmpty &&
        controllers[index].value.text.isEmpty) {
      controllers.removeAt(index);
      emit(TextFieldDeleted(controllers.length));
    }
  }

  // to fill controllers with the selected account data
  // for editing
  void fillControllers() {
    accountNameController.text = account.accountName!;
    controllers = account.accountAttributes!
        .map(
          (entry) => TextControllerAttribute(
            key: TextEditingController(
                text: EncryptionService.decrypt(entry.key)),
            value: TextEditingController(
                text: EncryptionService.decrypt(entry.value)),
            isSensitive: entry.isSensitive,
          ),
        )
        .toList();
    controllers.add(TextControllerAttribute());
  }

  List<AccountAttribute> getAttributesMapFromControllers() {
    var filteredControllers = controllers.asMap().entries.where(
      (entry) {
        var pair = entry.value;
        return pair.key.text.isNotEmpty && pair.value.text.isNotEmpty;
      },
    );
    return filteredControllers
        .map(
          (entry) => AccountAttribute(
            key: EncryptionService.encrypt(entry.value.key.text),
            value: EncryptionService.encrypt(entry.value.value.text),
            isSensitive: entry.value.isSensitive,
          ),
        )
        .toList();
  }

  void createRandomPassword(int passwordLength) {
    const String chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#%^&*()_+';
    final Random rnd = Random.secure();
    String password = String.fromCharCodes(
      Iterable.generate(
        passwordLength,
        (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
      ),
    );

    for (int i = 0; i < controllers.length; i++) {
      if (controllers[i].key.text.toLowerCase() == 'password') {
        controllers[i].value.text = password;
        controllers[i].isSensitive = true;
        emit(TextFieldCreated(controllers, controllers.length));
        return;
      }
    }
    controllers[controllers.length - 1].key.text = 'Password';
    controllers[controllers.length - 1].value.text = password;
    controllers[controllers.length - 1].isSensitive = true;
    controllers.add(TextControllerAttribute());
    emit(TextFieldCreated(controllers, controllers.length));
  }

  void markAsSensitive(int index) {
    controllers[index].isSensitive = !controllers[index].isSensitive;
    emit(MarkAsSensitiveState(index, controllers[index].isSensitive));
  }
}