import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/events/events.dart';
import '../../../core/models/account.dart';
import '../../../core/routing/routes.dart';
import '../../../core/services/encryption_service.dart';
import '../data/account_attribute_for_ui.dart';
part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  late Account account;
  StreamSubscription? _subscription;
  AccountCubit() : super(AccountInitial()) {
    _subscription = eventBus.on<RefreshAccountEvent>().listen((event) {
      if(!isClosed) {
        refresh();
      }
    });
  }

  void setAccount(Account account) {
    this.account = account;
  }

  List<AccountAttributeForUi> extractAccountAttributes() {
    try {
      return account.accountAttributes!
          .map(
            (entry) =>
            AccountAttributeForUi(
              key: EncryptionService.decrypt(entry.key),
              value: EncryptionService.decrypt(entry.value),
              isHidden: entry.isSensitive,
            ),
      )
          .toList();
    } catch(e) {
      return [];
    }
  }

  void refresh() {
    emit(AccountRefreshState(DateTime.now()));
  }

  void showAttribute(AccountAttributeForUi attribute, BuildContext context) {
    context.push(Routes.pinView.path, extra: () {
      context.pop();
      attribute.isHidden = !attribute.isHidden;
      emit(ShowAttributeState(attribute));
    });
  }
  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
