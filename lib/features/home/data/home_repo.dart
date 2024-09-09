import 'package:accounts_protector/features/home/data/i_home_repo.dart';

import '../../../core/models/user_model.dart';
import '../../../core/networking/urls.dart';
import '../../../core/networking/web_services/api_service.dart';
import '../../../core/services/cache_service.dart';
import '../../../core/session_db/session_db.dart';

class HomeRepo implements IHomeRepo{
  final ApiService _apiService;
  final SessionDb _sessionDb;

  HomeRepo(this._apiService, this._sessionDb);

  @override
  Future<UserModel> fetchUserData() async {
    try{
      var response = await _apiService.get(
        path: Urls.getAllData,
        token: CacheService.getData(
          key: CacheServiceConstants.token,
        ),
      );
      UserModel userModel = UserModel.fromMap(response.data);
      _sessionDb.setUserModel(userModel);
      return userModel;
    }
    catch(e){
      rethrow;
    }
  }
}