import 'package:accounts_protector/core/services/encryption_service.dart';
import 'package:accounts_protector/features/authentication/data/dto/dto_auth.dart';
import 'package:accounts_protector/features/pin/logic/pin_state.dart';
import 'package:bloc/bloc.dart';
import '../../authentication/data/repo/i_auth_repo.dart';


class CreatePinCubit extends Cubit<PinState> {
  String pin = '';
  String confirmPin = '';
  int currentPinLength = 0;
  static const pinLength = 6;
  bool isConfirm = false;
  bool isReenter = false;
  IAuthRepo authRepo;

  CreatePinCubit(this.authRepo) : super(PinInitial());

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

  Future<void> addConfirmPinNumber(int number) async{
    if (currentPinLength < pinLength) {
      pin += number.toString();
      currentPinLength++;
      emit(AddNumberState(currentPinLength));
      if (currentPinLength == pinLength && pin == confirmPin) {
        isConfirm = true;
        await authRepo.setPin(
          pinRequestDto: PinRequestDto(
            pinHash: EncryptionService.hash(data: pin),
            pinHashConfirmation: EncryptionService.hash(data: confirmPin),
          ),
        );
        emit(PinSuccessState());
      } else if (currentPinLength == pinLength) {
        pin = '';
        currentPinLength = 0;
        confirmPin = '';
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
