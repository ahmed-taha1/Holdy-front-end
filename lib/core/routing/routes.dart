enum Routes{
  loginView('/loginView'),
  forgotPasswordView('/forgotPasswordView'),
  registerView('/registerView'),
  otpValidationView('/otpValidationView'),
  resetPasswordView('/ResetPasswordView'),
  platformView('/PlatformView'),
  createPlatformView('/CreatePlatformView'),
  createPinView('/CreatePinView'),
  pinView('/PinView'),
  splashView('/splashScreen'),
  settingsView('/settingsScreen'),
  accountView('/accountView'),
  createAccountView('/addAccountView'),
  updateAccountView('/editAccountView'),
  helpView('/helpView'),
  homeView('/homeView'),
  updatePlatformView('/editPlatformView');
  final String path;
  const Routes(this.path);
}