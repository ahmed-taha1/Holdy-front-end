import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_app_bar_with_back.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widgets/spacing.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_input_text_field.dart';
import '../../../../../core/widgets/view_header.dart';
import 'package:accounts_protector/features/authentication/logic/forgot_password/forgot_password_cubit.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: CustomAppBarWithBack(
        isScrolled: true,
        backGroundColor: Theme.of(context).scaffoldBackgroundColor,
        arrowColor: Theme.of(context).primaryColor,
      ),

      body: SafeArea(
        child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
          listener: (context, state) {
            if (state is ResetPasswordSuccess) {
              EasyLoading.dismiss();
              context.go(Routes.loginView.path);
            }
          },
          child: SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpace(50),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 42.w),
                    child: const ViewHeader(
                      mainText: 'Reset Password',
                      subText:
                          'Please fill the input blow here to reset your password',
                      iconPath: 'assets/svgs/reset_password_icon.svg',
                    ),
                  ),
                  verticalSpace(30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Column(
                      children: [
                        CustomInputField(
                          icon: Icons.lock,
                          hintText: 'NEW PASSWORD',
                          controller: context
                              .read<ForgotPasswordCubit>()
                              .passwordController,
                          keyboardType: TextInputType.text,
                          isPassword: true,
                        ),
                        CustomInputField(
                          icon: Icons.lock,
                          hintText: 'RE-ENTER NEW PASSWORD',
                          controller: context
                              .read<ForgotPasswordCubit>()
                              .rePasswordController,
                          keyboardType: TextInputType.text,
                          isPassword: true,
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(18),
                  CustomButton(
                    text: 'Reset',
                    onPressed: () {
                      context.read<ForgotPasswordCubit>().resetPassword();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
