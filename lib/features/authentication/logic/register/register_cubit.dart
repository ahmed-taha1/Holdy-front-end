import 'package:accounts_protector/core/errors/failures.dart';
import 'package:accounts_protector/core/helper/cache_helper.dart';
import 'package:accounts_protector/features/authentication/data/dto/dto_auth.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repo/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  bool isLoadingState = false;

  Future<void> register(
      {required RegisterRequestDto registerRequestDto}) async {
    emit(RegisterLoadingState());
    isLoadingState = true;
    try {
      var response = await AuthRepo().register(registerRequestDto: registerRequestDto);
      CacheHelper.putData(key: 'token', value: response.token);
      isLoadingState = false;
      emit(RegisterSuccessState());
    } catch (e) {
      if(e is ServerFailure){
        emit(RegisterFailureState(errorMassage: e.errorMassage));
      }
      else{
        emit(const RegisterFailureState(errorMassage: 'Something went wrong'));
      }
      isLoadingState = false;
    }
  }
}
