enum Routes{
  loginView('/loginView'),
  forgotPasswordView('/forgotPasswordView'),
  registerView('/registerView'),
  otpValidationView('/otpValidationView'),
  resetPasswordView('/ResetPasswordView'),
  platformsView('/Platforms'),
  pinView('/PinView');

  final String path;
  const Routes(this.path);
}