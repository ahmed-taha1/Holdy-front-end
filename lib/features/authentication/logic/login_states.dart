import 'package:equatable/equatable.dart';

abstract class LoginStates extends Equatable {
  const LoginStates();
  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginStates {}
class LoginLoadingState extends LoginStates {}
class LoginSuccessState extends LoginStates {}
class LoginFailureState extends LoginStates {
  final String errorMassage;

  const LoginFailureState(this.errorMassage);
}
