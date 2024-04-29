import 'package:accounts_protector/core/helper/cache_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  bool? isDark;
  SettingsCubit() : super(SettingsInitial()){
    isDark = CacheHelper.getData(key: CacheHelperConstants.isDark) ?? false;
  }

  void logout(){
    emit(LogoutSuccess());
    CacheHelper.clearCache();
  }
}
