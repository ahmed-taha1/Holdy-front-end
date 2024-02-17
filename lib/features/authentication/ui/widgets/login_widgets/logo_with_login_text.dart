import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theming/styles.dart';

class LogoWithLoginText extends StatelessWidget {
  const LogoWithLoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(85.h),
        SvgPicture.asset("assets/svgs/light-logo.svg",
            height: 174.h, width: 174.w),
        verticalSpace(50.h),
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Login',
                style: TextStyles.font30DarkGreenBold,
              ),
              verticalSpace(10.h),
              Text(
                'Please sign in to continue',
                style: TextStyles.font15DarkGreySemiBold,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
