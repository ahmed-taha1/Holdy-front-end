enum Routes{
  loginView('/loginView'),
  forgotPasswordView('/forgotPasswordView'),
  registerView('/registerView'),
  otpValidationView('/otpValidationView'),
  resetPasswordView('/ResetPasswordView'),
  platformsView('/Platforms'),
  createPinView('/CreatePinView'),
  pinView('/PinView');

  final String path;
  const Routes(this.path);
}