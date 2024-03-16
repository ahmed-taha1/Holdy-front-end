
import 'package:accounts_protector/features/authentication/data/dto/dto_auth.dart';

abstract class IAuthRepo{
  Future<LoginResponseDto> login({required String email,required String password});
  Future<RegisterResponseDto> register({required RegisterRequestDto registerRequestDto});
  Future<void> setPin({required PinRequestDto pinRequestDto});
}