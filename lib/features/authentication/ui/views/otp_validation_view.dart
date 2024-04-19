import 'package:flutter/material.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_app_app_bar_with_back.dart';
import '../widgets/otp_validation_widgets/otp_validation_body.dart';

class OtpValidationView extends StatelessWidget {
  const OtpValidationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBarWithBack(
        isScrolled: true,
        backGroundColor: AppColors.white,
      ),
      body: OtpValidationViewBody(),
      backgroundColor: AppColors.white,
    );
  }
}
