import 'package:accounts_protector/core/failures/i_failure.dart';
import 'package:accounts_protector/core/services/cache_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/models/user_model.dart';
import '../data/i_settings_repo.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  bool? isDark;
  ISettingsRepo settingsRepo;
  UserModel? userModel;
  SettingsCubit(this.settingsRepo) : super(SettingsInitial());

  Future<void> initialize() async {
    userModel = settingsRepo.cloneUserData();
    isDark = await CacheService.getData(key: CacheServiceConstants.isDark) ?? false;
  }

  void logout() {
    emit(LogoutSuccess(time: DateTime.now()));
    CacheService.logout();
    settingsRepo.clearUserData();
  }

  void reportBug(String message) {
    emit(ReportBugLoading());
    try {
      if (message.isEmpty) throw const Failure('Message cannot be empty');
      settingsRepo.reportBug(message);
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
