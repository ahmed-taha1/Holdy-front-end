import 'package:accounts_protector/core/services/cache_service.dart';
import 'package:accounts_protector/features/authentication/data/dto/dto_auth.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../core/di/get_it.dart';
import '../../../../core/failures/i_failure.dart';
import '../../data/repo/i_auth_repo.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  LoginResponseDto? loginResponseDto;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void>login() async{
    try{
      if(formKey.currentState!.validate()){
        emit(LoginLoadingState());
        String email = emailController.text;
        String password = passwordController.text;
        loginResponseDto =
            await getIt<IAuthRepo>().login(email: email, password: password);
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
          emailController.clear();
          passwordController.clear();
          emit(LoginSuccessState());
        }
      }
    }catch(e){
      if(e is Failure) {
        emit(LoginFailureState(e.message));
      }
      else {
        emit(const LoginFailureState('Something went wrong'));
      }
    }
  }
}
