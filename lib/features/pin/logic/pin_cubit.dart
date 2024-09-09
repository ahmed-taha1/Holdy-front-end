import 'package:accounts_protector/core/services/cache_service.dart';
import 'package:accounts_protector/core/services/encryption_service.dart';
import 'package:accounts_protector/core/services/spam_detection_service.dart';
import 'package:accounts_protector/features/pin/logic/pin_state.dart';
import 'package:bloc/bloc.dart';

import '../../../core/failures/i_failure.dart';

class PinCubit extends Cubit<PinState> {
  PinCubit() : super(PinInitial()) {
    userPinHash = CacheService.getData(key: CacheServiceConstants.pinHash);
  }

  String currentPin = '';
  int currentPinLength = 0;
  static const pinLength = 6;
  final String processName = 'PinCubit';
  late final String userPinHash;

  Future<void> addNumber(int number) async {
    try {
      if (currentPinLength < pinLength) {
        currentPin += number.toString();
        currentPinLength++;
        emit(AddNumberState(currentPinLength));
        if (currentPinLength == pinLength) {
          SpamDetector.isSpam(processName);
          if (userPinHash == EncryptionService.hash(data: currentPin)) {
            emit(PinSuccessState());
            String key = EncryptionService.generateKey(data: currentPin);
            SpamDetector.clearSpam(processName);
            if (CacheService.getData(key: CacheServiceConstants.key) != key) {
              await CacheService.putData(
                key: key,
                value: EncryptionService.generateKey(data: currentPin),
              );
            }
            EncryptionService.setKey(
              key,
            );
          } else {
            SpamDetector.addFailure(processName);
            emit(const PinFailureState('Wrong pin'));
          }
          currentPin = '';
          currentPinLength = 0;
        }
      }
    } catch (e) {
      if (e is Failure) {
        emit(PinFailureState(e.message));
      } else {
        emit(const PinFailureState('Something went wrong'));
      }
      currentPin = '';
      currentPinLength = 0;
    }
  }

  void removeNumber() {
    if (currentPinLength > 0) {
      currentPin = currentPin.substring(0, currentPin.length - 1);
      currentPinLength--;
      emit(RemoveNumberState(currentPinLength));
    }
  }
}
