import 'package:accounts_protector/core/errors/failures.dart';
import 'package:accounts_protector/core/helper/cache_helper.dart';
import 'package:accounts_protector/features/authentication/data/dto/dto_auth.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repo/auth_repo.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  bool isLoading = false;
  String email = '';
  void sendEmail({required String email}) async {
    isLoading = true;
    emit(ForgotPasswordLoading());
    try {
      await AuthRepo().sendOtp(email: email);
      isLoading = false;
      this.email = email;
      emit(SendEmailSuccess());
    } catch (e) {
      if (e is ServerFailure) {
        emit(ForgotPasswordFailure(errorMessage: e.errorMassage));
      }
      else{
        emit(const ForgotPasswordFailure(errorMessage: 'Something went wrong'));
      }
      isLoading = false;
    }
  }

  void resendEmail() async {
    emit(ForgotPasswordLoading());
    try {
      await AuthRepo().sendOtp(email: email);
      emit(ResendSendEmailSuccess());
    } catch (e) {
      if (e is ServerFailure) {
        emit(ForgotPasswordFailure(errorMessage: e.errorMassage));
      }
      else{
        emit(const ForgotPasswordFailure(errorMessage: 'Something went wrong'));
      }
    }
  }

  void verifyOtp({required String otp}) async {
    isLoading = true;
    emit(ForgotPasswordLoading());
    try {
      VerifyOtpResponseDto response = await AuthRepo().verifyOtp(otp: otp, email: email);
      CacheHelper.putData(key: CacheHelperConstants.tempOtpToken, value: response.token);
      isLoading = false;
      emit(OtpValidationSuccess());
    } catch (e) {
      if (e is ServerFailure) {
        emit(ForgotPasswordFailure(errorMessage: e.errorMassage));
      }
      else{
        emit(const ForgotPasswordFailure(errorMessage: 'Something went wrong'));
      }
      isLoading = false;
    }
  }

  void resetPassword({required String newPassword, required String newPasswordRepeat}) async {
    isLoading = true;
    emit(ForgotPasswordLoading());
    try {
      await AuthRepo().resetPassword(resetPasswordRequestDto: ResetPasswordRequestDto(newPassword: newPassword, newPasswordRepeat: newPasswordRepeat));
      isLoading = false;
      emit(ResetPasswordSuccess());
    } catch (e) {
      if (e is ServerFailure) {
        emit(ForgotPasswordFailure(errorMessage: e.errorMassage));
      }
      else{
        emit(const ForgotPasswordFailure(errorMessage: 'Something went wrong'));
      }
      isLoading = false;
    }
  }
}
