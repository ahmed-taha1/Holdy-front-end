import 'package:accounts_protector/features/authentication/data/repo/auth_repo_imp.dart';
import 'package:accounts_protector/features/authentication/logic/login_states.dart';
import 'package:bloc/bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());


  Future<void>login({required String email,required String password})async{
    emit(LoginLoadingState());
    try{
      await AuthRepoImp().login(email: email, password: password);
      emit(LoginSuccessState());
    }catch(e){
      emit(LoginFailureState(e.toString()));
    }
  }

}
