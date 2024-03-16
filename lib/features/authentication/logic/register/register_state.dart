part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}
class RegisterLoadingState extends RegisterState {}
class RegisterSuccessState extends RegisterState {}
class RegisterFailureState extends RegisterState {
  final String errorMassage;
  const RegisterFailureState({required this.errorMassage});
  @override
  List<Object> get props => [errorMassage];
}