import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_app_app_bar_with_back.dart';
import '../widgets/edit_platform_widgets/edit_platform_body.dart';

class EditPlatformView extends StatelessWidget {
  const EditPlatformView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarWithBack(
        brightness: Brightness.dark,
        statusBarColor: AppColors.white,
        isScrolled: true,
      ),
      backgroundColor: AppColors.white,
      body: EditPlatformViewBody(),
    );
  }
}
