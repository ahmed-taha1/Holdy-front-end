import 'package:accounts_protector/core/helper/cache_helper.dart';
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
        token: CacheHelper.getData(key: CacheHelperConstants.tempPinToken),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> sendOtp({required String email}) async{
    try{
      await ApiService().post(
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
      var response = await ApiService().post(
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
      await ApiService().put(
        path: Urls.resetPassword,
        body: resetPasswordRequestDto.toJson(),
        token: CacheHelper.getData(key: CacheHelperConstants.tempOtpToken),
      );
    }
    catch (e) {
      rethrow;
    }
  }
}
