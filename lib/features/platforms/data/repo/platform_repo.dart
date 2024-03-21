import 'package:accounts_protector/core/helper/cache_helper.dart';
import 'package:accounts_protector/core/networking/web_services/api_service.dart';
import '../../../../core/models/user_model/user_model.dart';
import '../../../../core/networking/urls.dart';
import 'i_platform_repo.dart';

class PlatformRepo implements IPlatformRepo {
  @override
  Future<UserModel> getAllUserData() async {
    try {
      var response = await ApiService().get(
        path: Urls.getAllData,
        token: CacheHelper.getData(
          key: CacheHelperConstants.token,
        ),
      );
      UserModel userModel = UserModel.fromMap(response.data);
      return userModel;
    } catch (e) {
      rethrow;
    }
  }
}
