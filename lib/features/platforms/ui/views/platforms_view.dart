import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

import '../widgets/platforms_view_widgets/platforms_view_body.dart';

class PlatformsView extends StatelessWidget {
  const PlatformsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.purple,
      body: PlatformsViewBody(),
    );
  }
}
