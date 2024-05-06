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
  splashView('/splashScreen'),
  settingsView('/settingsScreen'),
  accountsView('/accounts'),
  accountView('/accountView'),
  addAccountView('/addAccountView'),
  editAccountView('/editAccountView'),
  helpView('/helpView'),
  editPlatformView('/editPlatformView');
  final String path;
  const Routes(this.path);
}