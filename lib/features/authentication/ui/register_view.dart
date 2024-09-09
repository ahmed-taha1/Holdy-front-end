import 'package:accounts_protector/features/authentication/ui/widgets/Register_widgets/register_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/custom_app_app_bar_with_back.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_input_text_field.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/spacing.dart';
import '../../../../core/widgets/view_header.dart';
import '../logic/register/register_cubit.dart';
import '../logic/register/register_input_validation_functions.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBack(
        isScrolled: true,
        arrowColor: Theme.of(context).primaryColor,
        backGroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                  controller: context.read<RegisterCubit>().firstNameController,
                  keyboardType: TextInputType.text,
                  validationFunction:
                  RegisterInputValidationFunctions.firstNameValidator,
                ),
                verticalSpace(11),
                CustomInputField(
                  icon: Icons.person,
                  hintText: 'LAST NAME',
                  controller: context.read<RegisterCubit>().lastNameController,
                  keyboardType: TextInputType.text,
                ),
                verticalSpace(11),
                CustomInputField(
                  icon: Icons.email_outlined,
                  hintText: 'EMAIL',
                  controller: context.read<RegisterCubit>().emailController,
                  keyboardType: TextInputType.emailAddress,
                  validationFunction:
                  RegisterInputValidationFunctions.emailFieldValidator,
                ),
                verticalSpace(11),
                CustomInputField(
                  icon: Icons.phone,
                  hintText: 'PHONE',
                  controller: context.read<RegisterCubit>().phoneController,
                  keyboardType: TextInputType.phone,
                  validationFunction:
                  RegisterInputValidationFunctions.phoneNumberValidator,
                ),
                verticalSpace(11),
                CustomInputField(
                  icon: Icons.lock_outline,
                  hintText: 'PASSWORD',
                  controller: context.read<RegisterCubit>().passwordController,
                  keyboardType: TextInputType.text,
                  isPassword: true,
                  validationFunction:
                  RegisterInputValidationFunctions.passwordValidator,
                ),
                verticalSpace(11),
                CustomInputField(
                  icon: Icons.lock_outline,
                  hintText: 'CONFIRM PASSWORD',
                  controller:
                  context.read<RegisterCubit>().confirmPasswordController,
                  keyboardType: TextInputType.text,
                  isPassword: true,
                  validationFunction: (value) =>
                      RegisterInputValidationFunctions.confirmPasswordValidator(
                          value,
                          context.read<RegisterCubit>().passwordController.text),
                ),
                verticalSpace(18),
                CustomButton(
                  onPressed: () {
                    context.read<RegisterCubit>().register();
                  },
                  text: 'REGISTER',
                ),
                verticalSpace(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyles.font15DarkGreySemiBold.copyWith(
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
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
                const RegisterBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
