import 'package:accounts_protector/core/helper/cache_helper.dart';
import 'package:accounts_protector/core/helper/encryption_helper.dart';
import 'package:accounts_protector/features/pin/logic/pin_state.dart';
import 'package:bloc/bloc.dart';


class PinCubit extends Cubit<PinState> {
  PinCubit() : super(PinInitial());
  String pin = '';
  int currentPinLength = 0;
  static const pinLength = 6;

  void addNumber(int number) {
    if (currentPinLength < pinLength) {
      pin += number.toString();
      currentPinLength++;
      emit(AddNumberState(currentPinLength));
      if (currentPinLength == pinLength) {
        if(CacheHelper.getData(key: CacheHelperConstants.pinHash) == EncryptionHelper.hash(data: pin)){
          if(CacheHelper.getData(key: CacheHelperConstants.key) != EncryptionHelper.generateKey(data: pin)) {
            CacheHelper.putData(key: CacheHelperConstants.key,
                value: EncryptionHelper.generateKey(data: pin));
          }
          EncryptionHelper.setKey(CacheHelper.getData(key: CacheHelperConstants.key));
          emit(PinSuccessState());
        }
        else {
          emit(const PinFailureState('Wrong pin'));
        }
        pin = '';
        currentPinLength = 0;
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
