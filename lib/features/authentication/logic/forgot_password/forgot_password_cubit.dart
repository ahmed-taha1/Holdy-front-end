import 'package:accounts_protector/core/services/cache_service.dart';
import 'package:accounts_protector/features/authentication/data/dto/dto_auth.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/failures/i_failure.dart';
import '../../data/repo/i_auth_repo.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  IAuthRepo authRepo;
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  ForgotPasswordCubit(this.authRepo) : super(ForgotPasswordInitial());

  Future<void> sendEmail() async {
    emit(ForgotPasswordLoading());
    try {
      await authRepo.sendOtp(email: emailController.text);
      emit(SendEmailSuccess());
    } catch (e) {
      String errorMessage = 'Something went wrong please try again later';
      if (e is Failure) {
        errorMessage = e.message;
      }
      emit(ForgotPasswordFailure(errorMessage: errorMessage));
    }
  }

  Future<void> resendEmail() async {
    emit(ForgotPasswordLoading());
    try {
      await authRepo.sendOtp(email: emailController.text);
      emit(ResendSendEmailSuccess());
    } catch (e) {
      String errorMessage = 'Something went wrong please try again later';
      if (e is Failure) {
        errorMessage = e.message;
      }
      emit(ForgotPasswordFailure(errorMessage: errorMessage));
    }
  }

  Future<void> verifyOtp() async {
    emit(ForgotPasswordLoading());
    try {
      VerifyOtpResponseDto response =
          await authRepo.verifyOtp(otp: otpController.text, email: emailController.text);
      CacheService.putData(
          key: CacheServiceConstants.tempOtpToken, value: response.token);
      emit(OtpValidationSuccess());
    } catch (e) {
      String errorMessage = 'Something went wrong please try again later';
      if (e is Failure) {
        errorMessage = e.message;
      }
      emit(ForgotPasswordFailure(errorMessage: errorMessage));
    }
  }

  Future<void> resetPassword() async {
    emit(ForgotPasswordLoading());
    try {
      await authRepo.resetPassword(
        resetPasswordRequestDto: ResetPasswordRequestDto(
          newPassword: passwordController.text,
          newPasswordRepeat: rePasswordController.text,
        ),
      );
      emit(ResetPasswordSuccess());
    } catch (e) {
      String errorMessage = 'Something went wrong please try again later';
      if (e is Failure) {
        errorMessage = e.message;
      }
      emit(ForgotPasswordFailure(errorMessage: errorMessage));
    }
  }

  // TODO fix this there is 3 removes from the stack
  // @override
  // Future<void> close() {
  //   passwordController.dispose();
  //   rePasswordController.dispose();
  //   emailController.dispose();
  //   otpController.dispose();
  //   return super.close();
  // }
}
