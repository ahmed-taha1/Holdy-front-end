import 'package:accounts_protector/core/networking/web_services/api_service.dart';
import 'package:accounts_protector/features/authentication/data/repo/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  @override
  Future<void> login({required String email,required String password}) async {
    try {
      await ApiService().post(path: 'login', body: {
        'email': email,
        'password': password,
      });
    } catch (e) {
      rethrow;
    }
  }
}
