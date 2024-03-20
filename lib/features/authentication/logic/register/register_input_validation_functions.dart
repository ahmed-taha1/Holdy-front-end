class RegisterInputValidationFunctions {
  static String? Function(String?) emailFieldValidator = (String? value) {
    if (value == null || value.isEmpty) {
      return 'Email field is required';
    }
    else if(!value.contains('@')){
      return 'Invalid email';
    }
    return null;
  };

  static String? Function(String?) passwordValidator = (String? value) {
    if (value == null || value.isEmpty) {
      return 'Password field is required';
    }
    if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~\-+=]).{8,}$').hasMatch(value)) {
      return 'Password must contain:\n * at least 8 characters\n * uppercase letter\n * lowercase letter\n * number\n * special character';
    }
    return null;
  };

  static String? Function(String?, String?) confirmPasswordValidator = (String? value, String? value2) {
    if (value == null || value.isEmpty) {
      return 'Confirm Password field is required';
    }
    if(value != value2){
      return 'Password does not match';
    }
    return null;
  };

  static String? Function(String?) firstNameValidator = (String? value) {
    if (value == null || value.isEmpty) {
      return 'first name field is required';
    }
    return null;
  };

  static String? Function(String?) phoneNumberValidator = (String? value) {
    if (!RegExp(r'^[0-9]+$').hasMatch(value!)) {
      return 'Invalid phone number';
    }
    return null;
  };
}