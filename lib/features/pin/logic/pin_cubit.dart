import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pin_state.dart';

class PinCubit extends Cubit<PinState> {
  PinCubit() : super(PinInitial());
  String pin = '';
  String confirmPin = '';
  int currentPinLength = 0;
  static const pinLength = 6;
  bool isConfirm = false;

  void addNumber(int number) {
    if (currentPinLength < pinLength) {
      pin += number.toString();
      currentPinLength++;
      emit(AddNumberState());
      if (currentPinLength == pinLength) {
        isConfirm = true;
        confirmPin = pin;
        pin = '';
        currentPinLength = 0;
        emit(PinSuccessState());
      }
    }
  }

  void addNumber1({required int number, bool isConfirm = false}) {
    if (currentPinLength < pinLength) {
      pin += number.toString();
      currentPinLength++;
      emit(AddNumberState());
      if (currentPinLength == pinLength) {
        emit(PinSuccessState());
      }
    }
  }
}
