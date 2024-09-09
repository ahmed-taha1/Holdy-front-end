import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/text_styles.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_input_text_field.dart';
import '../../../core/widgets/custom_text_button.dart';
import '../../../core/widgets/spacing.dart';
import '../../../core/widgets/view_header.dart';
import '../logic/login/login_cubit.dart';
import '../logic/login/login_input_validation_functions.dart';
import 'widgets/login_widgets/login_bloc_listener.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(
      //   backGroundColor: Theme.of(context).scaffoldBackgroundColor,
      // ),
      body: SingleChildScrollView(
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        // physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Form(
                key: context.read<LoginCubit>().formKey,
                child: Column(
                  children: [
                    verticalSpace(85),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: const ViewHeader(
                        mainText: 'Login',
                        subText: 'Please sign in to continue',
                        isLogoIncluded: true,
                      ),
                    ),
                    verticalSpace(33),
                    CustomInputField(
                      controller: context.read<LoginCubit>().emailController,
                      hintText: 'EMAIL',
                      icon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      validationFunction:
                          LoginInputValidationFunctions.emailFieldValidator,
                    ),
                    verticalSpace(12),
                    CustomInputField(
                      controller: context.read<LoginCubit>().passwordController,
                      hintText: 'PASSWORD',
                      icon: Icons.lock,
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                      validationFunction:
                          LoginInputValidationFunctions.passwordValidator,
                    ),
                  ],
                ),
              ),
            ),
            verticalSpace(18),
            CustomButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                context.read<LoginCubit>().login();
              },
              text: 'LOGIN',
            ),
            verticalSpace(14),
            CustomTextButton(
              text: 'Forgot Password?',
              textStyle: TextStyles.font14SemiLightBlueBold,
              onPressed: () {
                context.push(Routes.forgotPasswordView.path);
              },
            ),
            verticalSpace(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyles.font15DarkGreySemiBold.copyWith(
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
                CustomTextButton(
                  text: " Register",
                  textStyle: TextStyles.font14SemiLightBlueBold,
                  onPressed: () {
                    context.push(Routes.registerView.path);
                  },
                ),
              ],
            ),
            const LoginBlocListener(),
          ],
        ),
      ),
    );
  }
}
