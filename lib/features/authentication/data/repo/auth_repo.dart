import 'package:accounts_protector/core/services/cache_service.dart';
import 'package:accounts_protector/core/networking/web_services/api_service.dart';
import 'package:accounts_protector/features/authentication/data/dto/dto_auth.dart';
import 'package:accounts_protector/features/authentication/data/repo/i_auth_repo.dart';
import '../../../../core/networking/urls.dart';

class AuthRepo extends IAuthRepo {
  final ApiService _apiService;

  AuthRepo(this._apiService);

  @override
  Future<LoginResponseDto> login({required String email, required String password}) async {
    try {
      var response = await _apiService.post(
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
      var response = await _apiService.post(
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
      await _apiService.post(
        path: Urls.setPin,
        body: pinRequestDto.toJson(),
        token: CacheService.getData(key: CacheServiceConstants.tempPinToken),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> sendOtp({required String email}) async{
    try{
      await _apiService.post(
        path: Urls.sendOtp,
        body: {
          'email': email,
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<VerifyOtpResponseDto> verifyOtp({required String otp, required String email}) async{
    try{
      var response = await _apiService.post(
        path: Urls.verifyOtp,
        body: {
          'otpCode': otp,
          'email': email,
        },
      );
      return VerifyOtpResponseDto.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> resetPassword({required ResetPasswordRequestDto resetPasswordRequestDto}) async {
    try{
      await _apiService.put(
        path: Urls.resetPassword,
        body: resetPasswordRequestDto.toJson(),
        token: CacheService.getData(key: CacheServiceConstants.tempOtpToken),
      );
    }
    catch (e) {
      rethrow;
    }
  }
}
