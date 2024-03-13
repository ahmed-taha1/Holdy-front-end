import 'package:accounts_protector/features/pin/ui/widgets/pin_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_app_app_bar_with_back.dart';

class PinView extends StatelessWidget {
  const PinView({super.key, this.setPin = false});

  final bool setPin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.h),
          child: const CustomAppBarWithBack()),
      body: const PinViewBody(),
    );
  }
}
