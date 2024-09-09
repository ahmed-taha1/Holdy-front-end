import 'dart:async';

import 'package:accounts_protector/core/events/events.dart';
import 'package:accounts_protector/core/models/account.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/models/platform.dart';

part 'platform_state.dart';

class PlatformCubit extends Cubit<PlatformState> {
  late Platform platform;
  StreamSubscription? _subscription;

  PlatformCubit() : super(PlatformInitial()) {
    _subscription = eventBus.on<RefreshPlatformEvent>().listen((event) {
      if (!isClosed) {
        refresh();
      }
    });
  }

  void setPlatform(Platform platform) {
    this.platform = platform;
  }

  void search(String query) {
    if (query.isEmpty) {
      emit(PlatformInitial());
    } else {
      List<Account> accounts = platform.accounts!
          .where((element) =>
              element.accountName!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(SearchPlatformState(accounts: accounts, searchQuery: query));
    }
  }

  void refresh() {
    emit(PlatformRefreshState(dateTime: DateTime.now()));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
