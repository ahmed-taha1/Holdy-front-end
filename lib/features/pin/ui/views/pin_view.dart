import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theming/app_colors.dart';
import '../widgets/pin_view_widgets/pin_view_body.dart';

class PinView extends StatelessWidget {
  const PinView({super.key});

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
        child: PinViewBody(),
      ),
    );
  }
}
