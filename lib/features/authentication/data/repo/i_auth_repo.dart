
import 'package:accounts_protector/features/authentication/data/dto/dto_auth.dart';

abstract class IAuthRepo{
  Future<LoginResponseDto> login({required String email,required String password});
  Future<RegisterResponseDto> register({required RegisterRequestDto registerRequestDto});
  Future<void> setPin({required PinRequestDto pinRequestDto});
  Future<void> sendOtp({required String email});
  Future<VerifyOtpResponseDto> verifyOtp({required String otp, required String email});
  Future<void> resetPassword({required ResetPasswordRequestDto resetPasswordRequestDto});
}