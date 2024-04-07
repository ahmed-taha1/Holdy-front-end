import 'package:accounts_protector/core/helper/cache_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  bool? isDark;
  SettingsCubit() : super(SettingsInitial()){
    isDark = CacheHelper.getData(key: CacheHelperConstants.isDark) ?? false;
  }

  Future<void> logout() async{
    await CacheHelper.clearCache();
    emit(LogoutSuccess());
  }

  void changeTheme() {
    isDark = !isDark!;
    CacheHelper.putData(key: CacheHelperConstants.isDark, value: isDark);
    emit(DarkModeChanged(isDark!));
  }
}
