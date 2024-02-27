import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_input_text_field.dart';
import '../../../../../core/widgets/default_auth_text.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController rePasswordController = TextEditingController();
    return SafeArea(
      child: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 42.w),
                child: const DefaultAuthText(
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
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      isPassword: true,
                    ),
                    CustomInputField(
                      icon: Icons.lock,
                      hintText: 'RE-ENTER NEW PASSWORD',
                      controller: rePasswordController,
                      keyboardType: TextInputType.text,
                      isPassword: true,
                    ),
                  ],
                ),
              ),
              verticalSpace(18),
              CustomButton(text: 'Reset', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
