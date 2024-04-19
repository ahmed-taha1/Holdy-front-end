import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:accounts_protector/core/widgets/keyboard_hider.dart';
import 'package:accounts_protector/core/widgets/view_header.dart';
import 'package:accounts_protector/features/authentication/logic/register/register_cubit.dart';
import 'package:accounts_protector/features/authentication/logic/register/register_input_validation_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_input_text_field.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../../data/dto/dto_auth.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController rePasswordController = TextEditingController();

    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          showCustomLoading();
        } else if (state is RegisterSuccessState) {
          EasyLoading.dismiss();
          context.go(Routes.createPinView.path);
        } else if (state is RegisterFailureState) {
          EasyLoading.dismiss();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMassage),
              backgroundColor: AppColors.red,
            ),
          );
        }
      },
      child: Container(
        color: AppColors.white,
        height: double.infinity,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Form(
            key: context.read<RegisterCubit>().formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: const ViewHeader(
                    vSpace: 10,
                    mainText: 'Create Account',
                    subText: 'Please fill the input below here',
                  ),
                ),
                verticalSpace(40),
                CustomInputField(
                  icon: Icons.person,
                  hintText: 'FIRST NAME',
                  controller: firstNameController,
                  keyboardType: TextInputType.text,
                  validationFunction:
                      RegisterInputValidationFunctions.firstNameValidator,
                ),
                verticalSpace(11),
                CustomInputField(
                  icon: Icons.person,
                  hintText: 'LAST NAME',
                  controller: lastNameController,
                  keyboardType: TextInputType.text,
                ),
                verticalSpace(11),
                CustomInputField(
                  icon: Icons.email_outlined,
                  hintText: 'EMAIL',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validationFunction:
                      RegisterInputValidationFunctions.emailFieldValidator,
                ),
                verticalSpace(11),
                CustomInputField(
                  icon: Icons.phone,
                  hintText: 'PHONE',
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  validationFunction:
                      RegisterInputValidationFunctions.phoneNumberValidator,
                ),
                verticalSpace(11),
                CustomInputField(
                  icon: Icons.lock_outline,
                  hintText: 'PASSWORD',
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  isPassword: true,
                  validationFunction:
                      RegisterInputValidationFunctions.passwordValidator,
                ),
                verticalSpace(11),
                CustomInputField(
                  icon: Icons.lock_outline,
                  hintText: 'CONFIRM PASSWORD',
                  controller: rePasswordController,
                  keyboardType: TextInputType.text,
                  isPassword: true,
                  validationFunction: (value) =>
                      RegisterInputValidationFunctions.confirmPasswordValidator(
                          value, passwordController.text),
                ),
                verticalSpace(18),
                CustomButton(
                  onPressed: () {
                    context.read<RegisterCubit>().register(
                          registerRequestDto: RegisterRequestDto(
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            email: emailController.text,
                            phoneNumber: phoneController.text,
                            password: passwordController.text,
                            confirmPassword: rePasswordController.text,
                          ),
                        );
                  },
                  text: 'REGISTER',
                ),
                verticalSpace(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyles.font15DarkGreySemiBold,
                    ),
                    CustomTextButton(
                      text: " Login",
                      textStyle: TextStyles.font14SemiLightBlueBold,
                      onPressed: () {
                        context.go(Routes.loginView.path);
                      },
                    ),
                  ],
                ),
                verticalSpace(15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
