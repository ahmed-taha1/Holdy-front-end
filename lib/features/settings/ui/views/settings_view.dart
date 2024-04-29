import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_app_bar_with_back.dart';
import '../widgets/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBack(
        isScrolled: true,
        backGroundColor: Theme.of(context).scaffoldBackgroundColor,
        arrowColor: Theme.of(context).primaryColor,
      ),
      body: const SettingsViewBody(),
      // backgroundColor: AppColors.white,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
