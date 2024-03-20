part of 'forgot_password_cubit.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();
  @override
  List<Object> get props => [];
}

class ForgotPasswordInitial extends ForgotPasswordState {}
class ForgotPasswordLoading extends ForgotPasswordState {}
class SendEmailSuccess extends ForgotPasswordState {}
class ResendSendEmailSuccess extends ForgotPasswordState {}
class OtpValidationSuccess extends ForgotPasswordState {}
class ResetPasswordSuccess extends ForgotPasswordState {}
class ForgotPasswordFailure extends ForgotPasswordState {
  final String errorMessage;
  const ForgotPasswordFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}