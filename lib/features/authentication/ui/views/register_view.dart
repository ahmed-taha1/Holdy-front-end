import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:accounts_protector/features/authentication/ui/widgets/Register_widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_app_bar_with_back.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBarWithBack(
        isScrolled: true,
        backGroundColor: AppColors.white,
      ),
      body: RegisterViewBody(),
      backgroundColor: AppColors.white,
    );
  }
}
