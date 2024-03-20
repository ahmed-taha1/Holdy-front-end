import 'package:accounts_protector/core/errors/failures.dart';
import 'package:accounts_protector/core/helper/cache_helper.dart';
import 'package:accounts_protector/features/authentication/data/dto/dto_auth.dart';
import 'package:accounts_protector/features/authentication/data/repo/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  LoginResponseDto? loginResponseDto;
  bool isLoading = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void>login({required String email,required String password})async{
    isLoading = true;
    emit(LoginLoadingState());
    try{
      if(formKey.currentState!.validate()){
        loginResponseDto =
            await AuthRepo().login(email: email, password: password);
        if (loginResponseDto!.pinHash == null ||
            loginResponseDto!.pinHash == '') {
          CacheHelper.putData(
              key: CacheHelperConstants.tempPinToken,
              value: loginResponseDto!.token);
          emit(NoPinState());
          return;
        } else {
          CacheHelper.putData(
              key: CacheHelperConstants.token, value: loginResponseDto!.token);
          CacheHelper.putData(
              key: CacheHelperConstants.pinHash,
              value: loginResponseDto!.pinHash);
          CacheHelper.putData(key: CacheHelperConstants.isLogged, value: true);
          emit(LoginSuccessState());
        }
      }
    }catch(e){
      if(e is ServerFailure) {
        emit(LoginFailureState(e.errorMassage));
      }
      else {
        emit(const LoginFailureState('Something went wrong'));
      }
      // isLoading = false;
    }
    isLoading = false;
  }
}
