import 'package:accounts_protector/core/di/get_it.dart';
import 'package:accounts_protector/core/errors/i_failure.dart';
import 'package:accounts_protector/core/helper/cache_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/i_settings_repo.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  bool? isDark;

  SettingsCubit() : super(SettingsInitial()) {
    isDark = CacheHelper.getData(key: CacheHelperConstants.isDark) ?? false;
  }

  void logout() {
    emit(LogoutSuccess(time: DateTime.now()));
    CacheHelper.logout();
  }

  void reportBug(String message) {
    emit(ReportBugLoading());
    try {
      if (message.isEmpty) throw const Failure('Message cannot be empty');
      getIt<ISettingsRepo>().reportBug(message);
      emit(ReportBugSuccess());
    } catch (e) {
      if (e is Failure) {
        emit(ReportBugFailed(message: e.message));
      } else {
        emit(const ReportBugFailed(message: 'An error occurred'));
      }
    }
  }
}
