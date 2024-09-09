import 'package:accounts_protector/core/di/get_it.dart';
import 'package:accounts_protector/core/models/user_model.dart';
import 'package:accounts_protector/core/networking/web_services/api_service.dart';
import 'package:accounts_protector/core/session_db/session_db.dart';

import '../../../core/services/cache_service.dart';
import '../../../core/networking/urls.dart';
import 'i_settings_repo.dart';

class SettingsRepo implements ISettingsRepo {
  final SessionDb sessionDb;

  const SettingsRepo(this.sessionDb);

  @override
  void reportBug(String message) {
    try {
      var body = {"message": message};
      getIt<ApiService>().post(
        path: Urls.reportBug,
        body: body,
        token: CacheService.getData(key: CacheServiceConstants.token),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  UserModel cloneUserData(){
    return sessionDb.getUserModel() ?? UserModel();
  }

  @override
  void clearUserData() {
    sessionDb.clearUserModel();
  }
}
