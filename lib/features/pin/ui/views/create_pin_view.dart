import 'package:accounts_protector/core/widgets/custom_app_bar.dart';
import 'package:accounts_protector/features/pin/ui/widgets/create_pin_widgets/create_pin_view_body.dart';
import 'package:flutter/material.dart';
import '../../../../core/theming/app_colors.dart';

class CreatePinView extends StatelessWidget {
  const CreatePinView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: PreferredSize(
      //     preferredSize: Size.fromHeight(40.h),
      //     child: const CustomAppBarWithBack()),
      appBar: CustomAppBar(backGroundColor: AppColors.white),
      body: CreatePinViewBody(),
      backgroundColor: AppColors.white,
    );
  }
}
