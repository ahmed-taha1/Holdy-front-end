import 'dart:math';
import 'package:accounts_protector/core/di/get_it.dart';
import 'package:accounts_protector/core/helper/encryption_helper.dart';
import 'package:accounts_protector/core/models/platform.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../core/errors/i_failure.dart';
import '../../../core/models/account.dart';
import '../data/i_accounts_repo.dart';
import '../data/pair.dart';
part 'accounts_state.dart';

class AccountsCubit extends Cubit<AccountsState> {
  AccountsCubit() : super(AccountsInitial());
  final TextEditingController accountNameController = TextEditingController();
  List<Pair<TextEditingController, TextEditingController>> controllers = [
    Pair(TextEditingController(), TextEditingController())
  ];
  Platform? selectedPlatform;
  Account? selectedAccount;
  List<Account> filteredAccounts = [];

  Future<void> createAccount() async {
    emit(AccountLoadingState());
    final Account account = Account(
      accountName: accountNameController.text,
      platformId: selectedPlatform!.platformId,
      accountFields: getAttributesMapFromControllers(),
    );
    try {
      int id = await getIt<IAccountsRepo>().createAccount(account);
      account.accountId = id;
      selectedPlatform?.accounts!.add(account);
      selectedPlatform?.numOfAccounts++;
      emit(CreateAccountSuccess());
      resetInputFields();
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
      await getIt<IAccountsRepo>().deleteAccount(selectedAccount!.accountId!);
      selectedPlatform?.accounts!.remove(selectedAccount);
      selectedPlatform?.numOfAccounts--;
      emit(AccountDeletedState(selectedAccount!.accountId!));
      resetInputFields();
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
      accountId: selectedAccount!.accountId,
      accountName: accountNameController.text,
      platformId: selectedPlatform!.platformId,
      accountFields: getAttributesMapFromControllers(),
    );
    try {
      await getIt<IAccountsRepo>().updateAccount(updatedAccount);
      selectedAccount!.accountName = updatedAccount.accountName;
      selectedAccount!.accountFields = updatedAccount.accountFields;
      emit(AccountUpdatedState());
      emit(AccountsInitial());
      resetInputFields();
    } catch (e) {
      if (e is Failure) {
        emit(FailedState(e.message));
      } else {
        emit(const FailedState('Something went wrong'));
      }
    }
  }

  void updatePlatform() {
    emit(UpdatePlatformState());
    emit(AccountsInitial());
  }

  void searchAccount(String query) {
    filteredAccounts = selectedPlatform!.accounts!
        .where((element) =>
            element.accountName!.toUpperCase().contains(query.toUpperCase()))
        .toList();
    emit(AccountSearchState(query));
  }

  void clearSearch() {
    filteredAccounts = [];
    emit(AccountsInitial());
  }

  // ************************************************** utils **************************************************

  void onTextFieldChanged(int index, String text) {
    if (index == controllers.length - 1 && text.isNotEmpty) {
      controllers.add(Pair(TextEditingController(), TextEditingController()));
      emit(TextFieldCreated(controllers, controllers.length));
    } else if (controllers[index].key.text.isEmpty &&
        controllers[index].value.text.isEmpty) {
      controllers.removeAt(index);
      emit(TextFieldDeleted(controllers.length));
    }
  }

  void resetInputFields() {
    accountNameController.clear();
    controllers = [Pair(TextEditingController(), TextEditingController())];
    // emit(AccountsInitial());
  }

  // to fill controllers with the selected account data
  // for editing
  void fillControllersWithSelectedAccountAttr(Account selectedAccount) {
    accountNameController.text = selectedAccount.accountName!;
    controllers = selectedAccount.accountFields!.entries
        .map((entry) => Pair(
            TextEditingController(text: EncryptionHelper.decrypt(entry.key)),
            TextEditingController(text: EncryptionHelper.decrypt(entry.value))))
        .toList();
    controllers.add(Pair(TextEditingController(), TextEditingController()));
  }

  Map<String, String> getAttributesMapFromControllers() {
    var filteredControllers = controllers.asMap().entries.where(
      (entry) {
        var pair = entry.value;
        return pair.key.text.isNotEmpty && pair.value.text.isNotEmpty;
      },
    );
    return Map.fromEntries(
      filteredControllers.map(
        (entry) => MapEntry(
          EncryptionHelper.encrypt(entry.value.key.text),
          EncryptionHelper.encrypt(entry.value.value.text),
        ),
      ),
    );
  }

  List<Pair<String, String>> getSelectedAccountAttributes() {
    return selectedAccount!.accountFields!.entries
        .map((entry) => Pair(EncryptionHelper.decrypt(entry.key),
            EncryptionHelper.decrypt(entry.value)))
        .toList();
  }

  void createRandomPassword(int passwordLength) {
    const String chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#%^&*()_+';
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
        emit(TextFieldCreated(controllers, controllers.length));
        return;
      }
    }
    controllers.add(Pair(TextEditingController(text: 'Password'),
        TextEditingController(text: password)));
    emit(TextFieldCreated(controllers, controllers.length));
  }
}
