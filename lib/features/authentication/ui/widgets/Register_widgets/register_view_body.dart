import 'package:accounts_protector/core/routing/app_router.dart';
import 'package:accounts_protector/core/widgets/logo_with_login_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_input_text_field.dart';
import '../../../../../core/widgets/custom_text_button.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstnameController = TextEditingController();
    TextEditingController lastnameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController rePasswordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 5,
        toolbarHeight: 33.h,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.0.h),
              child: const DefaultAuthTest(
                mainText: 'Create Account',
                subText: 'Plaese fill the input below here',
                photo: false,
                horizontalSpace: 0.5,
              ),
            ),
            verticalSpace(54),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.h),
              child: Column(
                children: [
                  CustomInputField(
                    icon: Icons.person,
                    hintText: 'First Name',
                    controller: firstnameController,
                    keyboardType: TextInputType.text,
                  ),
                  verticalSpace(11),
                  CustomInputField(
                    icon: Icons.person,
                    hintText: 'last Name',
                    controller: lastnameController,
                    keyboardType: TextInputType.text,
                  ),
                  verticalSpace(11),
                  CustomInputField(
                    icon: Icons.email_outlined,
                    hintText: 'Email',
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  verticalSpace(11),
                  CustomInputField(
                    icon: Icons.phone,
                    hintText: 'Phone',
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                  ),
                  verticalSpace(11),
                  CustomInputField(
                    icon: Icons.lock_outline,
                    hintText: 'Password',
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    isPassword: true,
                  ),
                  verticalSpace(11),
                  CustomInputField(
                    icon: Icons.lock_outline,
                    hintText: 'Confirm Paswword',
                    controller: rePasswordController,
                    keyboardType: TextInputType.text,
                    isPassword: true,
                  ),
                ],
              ),
            ),
            verticalSpace(18),
            CustomButton(
              onPressed: () {context.go(AppRouter.kLoginView);},
              text: 'REGISTER',
            ),
            verticalSpace(29),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyles.font15DarkGreySemiBold,
                ),
                CustomTextButton(
                  text: " Login",
                  textStyle: TextStyles.font14SemiLightGreenBold,
                  onPressed: () {
                    context.push(AppRouter.kRegisterView);
                  },
                ),
              ],
            ),
            verticalSpace(15),
          ],
        ),
      ),
    );
  }
}
