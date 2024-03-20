class LoginResponseDto {
  final String? token;
  final String? pinHash;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? expirationDate;

  LoginResponseDto({
    required this.token,
    required this.pinHash,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.expirationDate,
  });

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) {
    return LoginResponseDto(
      token: json['token'],
      pinHash: json['pinHash'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      expirationDate: json['expirationDate'],
    );
  }
}

class RegisterRequestDto {
  final String email;
  final String password;
  final String confirmPassword;
  final String firstName;
  final String lastName;
  final String phoneNumber;

  RegisterRequestDto({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
    };
  }
}

class RegisterResponseDto{
  final String? token;

  RegisterResponseDto({required this.token});

  factory RegisterResponseDto.fromJson(Map<String, dynamic> json){
    return RegisterResponseDto(
      token: json['token'],
    );
  }
}

class PinRequestDto{
  final String pinHash;
  final String pinHashConfirmation;

  PinRequestDto({required this.pinHash,required this.pinHashConfirmation});

  Map<String, dynamic> toJson(){
    return {
      'pinHash': pinHash,
      'pinHashConfirmation': pinHashConfirmation,
    };
  }
}

class VerifyOtpResponseDto{
  final String? token;

  VerifyOtpResponseDto({required this.token});

  factory VerifyOtpResponseDto.fromJson(Map<String, dynamic> json){
    return VerifyOtpResponseDto(
      token: json['token'],
    );
  }
}

class ResetPasswordRequestDto{
  final String newPassword;
  final String newPasswordRepeat;

  ResetPasswordRequestDto({required this.newPassword,required this.newPasswordRepeat});

  Map<String, dynamic> toJson(){
    return {
      'newPassword': newPassword,
      'newPasswordRepeat': newPasswordRepeat,
    };
  }
}