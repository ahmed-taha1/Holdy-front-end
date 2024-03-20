enum Routes{
  loginView('/loginView'),
  forgotPasswordView('/forgotPasswordView'),
  registerView('/registerView'),
  otpValidationView('/otpValidationView'),
  resetPasswordView('/ResetPasswordView'),
  platformsView('/Platforms'),
  addPlatformView('/AddPlatformView'),
  createPinView('/CreatePinView'),
  pinView('/PinView'),
  splashScreen('/splashScreen');

  final String path;
  const Routes(this.path);
}