import 'package:accounts_protector/core/networking/web_services/api_service.dart';
import 'package:accounts_protector/features/authentication/data/repo/i_auth_repo.dart';
import '../../../../core/networking/urls.dart';

class AuthRepo extends IAuthRepo {
  @override
  Future<void> login({required String email, required String password}) async {
    try {
      var response = await ApiService().post(
        path: Urls.login,
        body: {
          'email': email,
          'password': password,
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
