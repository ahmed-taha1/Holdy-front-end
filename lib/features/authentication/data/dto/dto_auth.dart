class LoginResponseDto {
  final String? token;
  final bool? isPinSet;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? expirationDate;

  LoginResponseDto({
    required this.token,
    required this.isPinSet,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.expirationDate,
  });

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) {
    return LoginResponseDto(
      token: json['token'],
      isPinSet: json['isPinSet'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      expirationDate: json['expirationDate'],
    );
  }

}