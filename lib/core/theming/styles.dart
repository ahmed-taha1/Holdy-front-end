import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:accounts_protector/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font30NavyBlueBold = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.navyBlue,
  );

  static TextStyle font15DarkGreySemiBold = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.darkGrey,
  );

  static TextStyle font17navyBlueBold = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.navyBlue,
  );

  static TextStyle font11LightGreyBold = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.lightGrey,
  );

  static TextStyle font14SemiLightGreenBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.semiLightGreen,
  );
}
