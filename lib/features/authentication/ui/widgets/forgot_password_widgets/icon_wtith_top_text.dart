import 'package:accounts_protector/core/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theming/styles.dart';

class IconWithTopText extends StatelessWidget {
  const IconWithTopText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 42.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
                'assets/svgs/forgot_password_icon_light.svg',
                height: 204.h,
                width: 204.w),
          ),
          verticalSpace(33),
          Text(
            'Forgot Password',
            style: TextStyles.font30NavyBlueBold,
          ),
          verticalSpace(10),
          Text(
            'Please enter your email to receive OTP',
            style: TextStyles.font15DarkGreySemiBold,
          ),
        ],
      ),
    );
  }
}
