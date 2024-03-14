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
  bool isReenter = false;


  void addNumber(int number) {
    if (currentPinLength < pinLength) {
      pin += number.toString();
      currentPinLength++;
      emit(AddNumberState(currentPinLength));
      if (currentPinLength == pinLength) {
        confirmPin = pin;
        pin = '';
        isReenter = true;
        currentPinLength = 0;
        emit(PinSuccessState());
      }
    }
  }

  void addConfirmPinNumber(int number) {
    if (currentPinLength < pinLength) {
      pin += number.toString();
      currentPinLength++;
      emit(AddNumberState(currentPinLength));
      if (currentPinLength == pinLength && pin == confirmPin) {
        isConfirm = true;
        currentPinLength = 0;
        emit(PinSuccessState());
      }
      else if(currentPinLength == pinLength && pin != confirmPin){
        pin = '';
        currentPinLength = 0;
        confirmPin='';
        isReenter = false;
        emit(const PinFailureState('Pin not match'));
      }

    }

  }

  void removeNumber() {
    if (currentPinLength > 0) {
      pin = pin.substring(0, pin.length - 1);
      currentPinLength--;
      emit(RemoveNumberState(currentPinLength));
    }
  }

}
