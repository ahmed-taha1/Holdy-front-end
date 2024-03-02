enum Routes{
  loginView('/loginView'),
  forgotPasswordView('/forgotPasswordView'),
  registerView('/registerView'),
  otpValidationView('/otpValidationView'),
  resetPasswordView('/ResetPasswordView'),
  platformsView('/Platforms'),
  addPlatformView('/addPlatform');

  final String path;
  const Routes(this.path);
}