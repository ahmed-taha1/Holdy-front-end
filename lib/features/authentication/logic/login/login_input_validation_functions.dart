class LoginInputValidationFunctions {
  static String? Function(String?)? emailFieldValidator = (String? value) {
    if (value == null || value.isEmpty) {
      return 'Email field is required';
    }
    else if(!value.contains('@')){
      return 'Invalid email';
    }
    return null;
  };

  static String? Function(String?)? passwordValidator = (String? value) {
    if (value == null || value.isEmpty) {
      return 'Password field is required';
    }
    return null;
  };
}