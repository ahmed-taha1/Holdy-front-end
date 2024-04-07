import 'package:accounts_protector/core/helper/cache_helper.dart';
import 'package:accounts_protector/core/networking/web_services/api_service.dart';
import 'package:accounts_protector/features/platforms/data/dto/platforms_dto.dart';
import '../../../../core/models/user_model.dart';
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

  @override
  Future<int> createPlatform(String platformName, String iconColor) async{
    try{
      var response = await ApiService().post(
        path: Urls.createPlatform,
        token: CacheHelper.getData(
          key: CacheHelperConstants.token,
        ),
        body: {
          "platformName": platformName,
          "iconColor": iconColor,
        },
      );
      return response.data['platformId'];
    } catch(e){
      rethrow;
    }
  }

  @override
  Future<void> deletePlatform(int platformId) async{
    try{
      await ApiService().delete(
        path: Urls.deletePlatform,
        token: CacheHelper.getData(
          key: CacheHelperConstants.token,
        ),
        body: {
          "id": platformId,
        },
      );
    } catch(e){
      rethrow;
    }
  }

  @override
  Future<void> updatePlatform(UpdatePlatformDto updatePlatformDto) async{
    try{
      await ApiService().put(
        path: Urls.updatePlatform,
        token: CacheHelper.getData(
          key: CacheHelperConstants.token,
        ),
        body: updatePlatformDto.toMap(),
      );
    } catch(e){
      rethrow;
    }
  }
}
