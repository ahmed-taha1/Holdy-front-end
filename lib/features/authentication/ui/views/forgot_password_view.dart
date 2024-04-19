import 'package:flutter/material.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_app_app_bar_with_back.dart';
import '../widgets/forgot_password_widgets/forgot_password_view_body.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBarWithBack(
        isScrolled: true,
        backGroundColor: AppColors.white,
      ),
      body: ForgotPasswordViewBody(),
    );
  }
}
