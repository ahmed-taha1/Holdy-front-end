import 'package:accounts_protector/core/helper/spacing.dart';
import 'package:accounts_protector/core/widgets/custom_button.dart';
import 'package:accounts_protector/core/widgets/custom_input_text_field.dart';
import 'package:accounts_protector/core/widgets/view_header.dart';
import 'package:accounts_protector/features/authentication/logic/forgot_password/forgot_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routing/routes.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    return SafeArea(
      child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if(state is SendEmailSuccess){
            context.push(Routes.otpValidationView.path);
          }
          else if(state is ForgotPasswordFailure){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          return SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
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
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  verticalSpace(18),
                  CustomButton(
                    isLoading: context.read<ForgotPasswordCubit>().isLoading,
                    text: 'Send',
                    onPressed: () {
                      context
                          .read<ForgotPasswordCubit>()
                          .sendEmail(email: emailController.text);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
