import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theming/app_colors.dart';
import '../widgets/login_widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: LoginViewBody(),
      ),
    );
  }
}
