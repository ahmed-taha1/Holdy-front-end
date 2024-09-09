import 'package:accounts_protector/core/services/cache_service.dart';
import 'package:accounts_protector/features/authentication/data/dto/dto_auth.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../core/failures/i_failure.dart';
import '../../data/repo/i_auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  IAuthRepo authRepo;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RegisterCubit(this.authRepo) : super(RegisterInitial());

  Future<void> register() async {
    RegisterRequestDto registerRequestDto = RegisterRequestDto(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      phoneNumber: phoneController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
    );

    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState());
      try {
        var response =
            await authRepo.register(registerRequestDto: registerRequestDto);
        CacheService.putData(
            key: CacheServiceConstants.tempPinToken, value: response.token);
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

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
