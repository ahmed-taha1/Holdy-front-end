import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_app_bar_with_back.dart';
import '../widgets/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarWithBack(
        isScrolled: true,
        backGroundColor: AppColors.white,
      ),
      body: SettingsViewBody(),
      backgroundColor: AppColors.white,
    );
  }
}
