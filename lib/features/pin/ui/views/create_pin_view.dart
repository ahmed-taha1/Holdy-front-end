import 'package:accounts_protector/features/pin/ui/widgets/create_pin_widgets/create_pin_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theming/app_colors.dart';

class CreatePinView extends StatelessWidget {
  const CreatePinView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: PreferredSize(
      //     preferredSize: Size.fromHeight(40.h),
      //     child: const CustomAppBarWithBack()),
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: CreatePinViewBody(),
      ),
    );
  }
}
