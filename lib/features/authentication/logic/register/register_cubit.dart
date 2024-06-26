import 'package:accounts_protector/core/services/cache_service.dart';
import 'package:accounts_protector/features/authentication/data/dto/dto_auth.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/di/get_it.dart';
import '../../../../core/failures/i_failure.dart';
import '../../data/repo/i_auth_repo.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> register(
      {required RegisterRequestDto registerRequestDto}) async {
    if(formKey.currentState!.validate()){
      emit(RegisterLoadingState());
      try {
        var response =
            await getIt<IAuthRepo>().register(registerRequestDto: registerRequestDto);
        CacheHelper.putData(
            key: CacheHelperConstants.tempPinToken, value: response.token);
        emit(RegisterSuccessState());
      } catch (e) {
        if (e is Failure) {
          emit(RegisterFailureState(errorMassage: e.message));
        } else {
          emit(
              const RegisterFailureState(errorMassage: 'Something went wrong'));
        }
      }
    }
  }
}
