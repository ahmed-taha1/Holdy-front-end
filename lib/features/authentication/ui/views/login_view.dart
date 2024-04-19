import 'package:flutter/material.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/login_widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(backGroundColor: AppColors.white),
      backgroundColor: AppColors.white,
      body: LoginViewBody(),
    );
  }
}
