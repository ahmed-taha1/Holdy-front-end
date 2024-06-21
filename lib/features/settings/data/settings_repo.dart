import 'package:accounts_protector/core/di/get_it.dart';
import 'package:accounts_protector/core/networking/web_services/api_service.dart';

import '../../../core/services/cache_service.dart';
import '../../../core/networking/urls.dart';
import 'i_settings_repo.dart';

class SettingsRepo implements ISettingsRepo {
  @override
  void reportBug(String message) {
    try {
      var body = {"message": message};
      getIt<ApiService>().post(
        path: Urls.reportBug,
        body: body,
        token: CacheHelper.getData(key: CacheHelperConstants.token),
      );
    } catch (e) {
      rethrow;
    }
  }
}
