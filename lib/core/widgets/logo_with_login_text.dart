import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../helper/spacing.dart';
import '../theming/styles.dart';

class DefaultAuthText extends StatelessWidget {
  const DefaultAuthText({super.key, required this.mainText, required this.subText, required this.photo, required this.horizontalSpace});
  final String mainText;
  final String subText;
  final bool photo;
  final double horizontalSpace;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(horizontalSpace.h),
        photo?SvgPicture.asset("assets/svgs/light-logo.svg",
            height: 174.h, width: 174.w):const Padding(padding: EdgeInsets.all(0)),
        verticalSpace(53.h),
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mainText,
                style: TextStyles.font30NavyBlueBold,
              ),
              verticalSpace(11.h),
              Text(
                subText,
                style: TextStyles.font15DarkGreySemiBold,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
