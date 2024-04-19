import 'package:accounts_protector/core/errors/failures.dart';
import 'package:accounts_protector/core/helper/cache_helper.dart';
import 'package:accounts_protector/features/authentication/data/dto/dto_auth.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/di/get_it.dart';
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
        if (e is ServerFailure) {
          emit(RegisterFailureState(errorMassage: e.errorMassage));
        } else {
          emit(
              const RegisterFailureState(errorMassage: 'Something went wrong'));
        }
      }
    }
  }
}
