import 'package:accounts_protector/core/errors/failures.dart';
import 'package:accounts_protector/core/helper/encryption_helper.dart';
import 'package:accounts_protector/core/models/platform.dart';
import 'package:accounts_protector/features/platforms/logic/platforms/platforms_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../core/models/account.dart';
import '../data/accounts_repo.dart';
import '../data/pair.dart';

part 'accounts_state.dart';



class AccountsCubit extends Cubit<AccountsState> {
  AccountsCubit() : super(AccountsInitial());
  final TextEditingController accountNameController = TextEditingController();
  List<Pair<TextEditingController, TextEditingController>> controllers = [
    Pair(TextEditingController(), TextEditingController())
  ];
  Platform? selectedPlatform;
  bool isLoading = false;
  Account? selectedAccount;



  Future<void> createAccount() async {
    emit(LoadingState());
    isLoading = true;
    removeEmptyControllers();
    final Account account = Account(
      accountName: accountNameController.text,
      platformId: selectedPlatform!.platformId,
      accountFields: getAttributesMapFromControllers(),
    );
    try {
      int id = await AccountsRepo().createAccount(account);
      account.accountId = id;
      selectedPlatform?.accounts!.add(account);
      selectedPlatform?.numOfAccounts++;
      emit(CreateAccountSuccess());
      resetInputFields();
    } catch (e) {
      if (e is ServerFailure) {
        emit(FailedState(e.errorMassage));
      } else {
        emit(const FailedState('Something went wrong'));
      }
    }
    isLoading = false;
  }

  Future<void> deleteAccount() async {
    emit(LoadingState());
    isLoading = true;
    try {
      await AccountsRepo().deleteAccount(selectedAccount!.accountId!);
      selectedPlatform?.accounts!.remove(selectedAccount);
      selectedPlatform?.numOfAccounts--;
      emit(AccountDeletedState(selectedAccount!.accountId!));
      resetInputFields();
    } catch (e) {
      if (e is ServerFailure) {
        emit(FailedState(e.errorMassage));
      } else {
        emit(const FailedState('Something went wrong'));
      }
    }
    isLoading = false;
  }

  Future<void> updateAccount() async {
    emit(LoadingState());
    isLoading = true;
    removeEmptyControllers();
    final Account updatedAccount = Account(
      accountId: selectedAccount!.accountId,
      accountName: accountNameController.text,
      platformId: selectedPlatform!.platformId,
      accountFields: getAttributesMapFromControllers(),
    );
    try {
      await AccountsRepo().updateAccount(updatedAccount);
      selectedAccount!.accountName = updatedAccount.accountName;
      selectedAccount!.accountFields = updatedAccount.accountFields;
      emit(AccountUpdatedState());
      emit(AccountsInitial());
      resetInputFields();
    } catch (e) {
      if (e is ServerFailure) {
        emit(FailedState(e.errorMassage));
      } else {
        emit(const FailedState('Something went wrong'));
      }
    }
    isLoading = false;
  }

  void updatePlatform(){
    emit(UpdatePlatformState());
    emit(AccountsInitial());
  }

  // ************************************************** utils **************************************************

  void onTextFieldChanged(int index, String text) {
    if (index == controllers.length - 1 && text.isNotEmpty) {
      controllers.add(Pair(TextEditingController(), TextEditingController()));
      emit(TextFieldCreated(controllers, controllers.length));
    }
    else if(controllers[index].key.text.isEmpty && controllers[index].value.text.isEmpty){
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

  void removeEmptyControllers() {
    controllers.removeWhere((element) =>
        element.key.text.isEmpty || element.value.text.isEmpty);
  }

  Map<String, String> getAttributesMapFromControllers() {
    return controllers.asMap().map(
          (index, pair) => MapEntry(
            EncryptionHelper.encrypt(pair.key.text),
            EncryptionHelper.encrypt(pair.value.text),
          ),
        );
  }

  List<Pair<String, String>> getSelectedAccountAttributes() {
    return selectedAccount!.accountFields!.entries
        .map((entry) => Pair(EncryptionHelper.decrypt(entry.key),
            EncryptionHelper.decrypt(entry.value)))
        .toList();
  }
}
