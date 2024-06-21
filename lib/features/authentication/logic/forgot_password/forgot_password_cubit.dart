import 'package:accounts_protector/core/di/get_it.dart';
import 'package:accounts_protector/core/services/cache_service.dart';
import 'package:accounts_protector/features/authentication/data/dto/dto_auth.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/failures/i_failure.dart';
import '../../data/repo/i_auth_repo.dart';
part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());
  String email = '';
  void sendEmail({required String email}) async {
    emit(ForgotPasswordLoading());
    try {
      await getIt<IAuthRepo>().sendOtp(email: email);
      this.email = email;
      emit(SendEmailSuccess());
    } catch (e) {
      if (e is Failure) {
        emit(ForgotPasswordFailure(errorMessage: e.message));
      }
      else{
        emit(const ForgotPasswordFailure(errorMessage: 'Something went wrong'));
      }
    }
  }

  void resendEmail() async {
    emit(ForgotPasswordLoading());
    try {
      await getIt<IAuthRepo>().sendOtp(email: email);
      emit(ResendSendEmailSuccess());
    } catch (e) {
      if (e is Failure) {
        emit(ForgotPasswordFailure(errorMessage: e.message));
      }
      else{
        emit(const ForgotPasswordFailure(errorMessage: 'Something went wrong'));
      }
    }
  }

  void verifyOtp({required String otp}) async {
    emit(ForgotPasswordLoading());
    try {
      VerifyOtpResponseDto response = await getIt<IAuthRepo>().verifyOtp(otp: otp, email: email);
      CacheHelper.putData(key: CacheHelperConstants.tempOtpToken, value: response.token);
      emit(OtpValidationSuccess());
    } catch (e) {
      if (e is Failure) {
        emit(ForgotPasswordFailure(errorMessage: e.message));
      }
      else{
        emit(const ForgotPasswordFailure(errorMessage: 'Something went wrong'));
      }
    }
  }

  void resetPassword({required String newPassword, required String newPasswordRepeat}) async {
    emit(ForgotPasswordLoading());
    try {
      await getIt<IAuthRepo>().resetPassword(resetPasswordRequestDto: ResetPasswordRequestDto(newPassword: newPassword, newPasswordRepeat: newPasswordRepeat));
      emit(ResetPasswordSuccess());
    } catch (e) {
      if (e is Failure) {
        emit(ForgotPasswordFailure(errorMessage: e.message));
      }
      else{
        emit(const ForgotPasswordFailure(errorMessage: 'Something went wrong'));
      }
    }
  }
}
