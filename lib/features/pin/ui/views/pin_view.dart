import 'package:accounts_protector/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../../core/theming/app_colors.dart';
import '../widgets/pin_view_widgets/pin_view_body.dart';

class PinView extends StatelessWidget {
  const PinView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(backGroundColor: AppColors.white),
      body: PinViewBody(),
      backgroundColor: AppColors.white,
    );
  }
}
