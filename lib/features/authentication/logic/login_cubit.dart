import 'package:accounts_protector/core/errors/failures.dart';
import 'package:accounts_protector/features/authentication/data/repo/auth_repo.dart';
import 'package:accounts_protector/features/authentication/logic/login_states.dart';
import 'package:bloc/bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());


  Future<void>login({required String email,required String password})async{
    emit(LoginLoadingState());
    try{
      await AuthRepo().login(email: email, password: password);
      emit(LoginSuccessState());
    }catch(e){
      if(e is ServerFailure) {
        emit(LoginFailureState(e.errorMassage));
      }
      else {
        emit(const LoginFailureState('Something went wrong'));
      }
    }
  }

}
