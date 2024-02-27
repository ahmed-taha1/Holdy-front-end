import 'package:accounts_protector/core/helper/spacing.dart';
import 'package:accounts_protector/core/widgets/custom_button.dart';
import 'package:accounts_protector/core/widgets/custom_input_text_field.dart';
import 'package:accounts_protector/core/widgets/default_auth_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/routes.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    return SafeArea(
      child: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              verticalSpace(50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 42.w),
                child: const DefaultAuthText(
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
                  text: 'Send',
                  onPressed: () {
                    context.push(Routes.otpValidationView.path);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
