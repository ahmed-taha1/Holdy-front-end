import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/routing/routes.dart';
import '../../../core/widgets/custom_app_app_bar_with_back.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_input_text_field.dart';
import '../../../core/widgets/custom_loading.dart';
import '../../../core/widgets/spacing.dart';
import '../../../core/widgets/view_header.dart';
import '../logic/forgot_password/forgot_password_cubit.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    // TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: CustomAppBarWithBack(
        isScrolled: true,
        backGroundColor: Theme.of(context).scaffoldBackgroundColor,
        arrowColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
          listener: (context, state) {
            if (state is ForgotPasswordLoading) {
              showCustomLoading();
            }
            if (state is SendEmailSuccess) {
              EasyLoading.dismiss();
              context.push(Routes.otpValidationView.path,
                  extra: context.read<ForgotPasswordCubit>());
            } else if (state is ForgotPasswordFailure) {
              EasyLoading.dismiss();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.redAccent,
                  content: Text(state.errorMessage),
                ),
              );
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
                      mainText: 'Forgot Password',
                      subText: 'Please enter your email to receive OTP',
                      iconPath: 'assets/svgs/forgot_password_icon.svg',
                    ),
                  ),
                  verticalSpace(30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: CustomInputField(
                      icon: Icons.email_outlined,
                      hintText: 'EMAIL',
                      controller:
                          context.read<ForgotPasswordCubit>().emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  verticalSpace(18),
                  CustomButton(
                    text: 'Send',
                    onPressed: () {
                      context.read<ForgotPasswordCubit>().sendEmail();
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
