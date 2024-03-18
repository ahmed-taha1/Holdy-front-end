import 'package:equatable/equatable.dart';

abstract class PinState extends Equatable {
  const PinState();
  @override
  List<Object> get props => [];
}

class PinInitial extends PinState {}
class AddNumberState extends PinState  {
  final int currentPinLength;

  const AddNumberState(this.currentPinLength);

  @override
  List<Object> get props => [currentPinLength];
}
class RemoveNumberState extends PinState{
  final int currentPinLength;

  const RemoveNumberState(this.currentPinLength);

  @override
  List<Object> get props => [currentPinLength];
}
class PinSuccessState extends PinState{}
class PinFailureState extends PinState {
  final String errorMassage;
  const PinFailureState(this.errorMassage);
}
