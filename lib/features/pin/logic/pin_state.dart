part of 'pin_cubit.dart';

abstract class PinState extends Equatable {
  const PinState();
  @override
  List<Object> get props => [];
}

class PinInitial extends PinState {}
class AddNumberState extends PinState{}
class RemoveNumberState extends PinState{}
class PinSuccessState extends PinState{}
class PinFailureState extends PinState {
  final String errorMassage;
  const PinFailureState(this.errorMassage);
}
