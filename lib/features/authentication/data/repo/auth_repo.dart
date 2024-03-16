import 'package:accounts_protector/core/networking/web_services/api_service.dart';
import 'package:accounts_protector/features/authentication/data/dto/dto_auth.dart';
import 'package:accounts_protector/features/authentication/data/repo/i_auth_repo.dart';
import '../../../../core/networking/urls.dart';

class AuthRepo extends IAuthRepo {
  @override
  Future<LoginResponseDto> login({required String email, required String password}) async {
    try {
      var response = await ApiService().post(
        path: Urls.login,
        body: {
          'email': email,
          'password': password,
        },
      );
      return LoginResponseDto.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RegisterResponseDto> register({required RegisterRequestDto registerRequestDto}) async {
    try{
      var response = await ApiService().post(
        path: Urls.register,
        body: registerRequestDto.toJson(),
      );
      return RegisterResponseDto.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> setPin({required PinRequestDto pinRequestDto}) async {
    try{
      var response = await ApiService().post(
        path: Urls.setPin,
        body: pinRequestDto.toJson(),
        addAuth: true,
      );
    } catch (e) {
      rethrow;
    }
  }
}
