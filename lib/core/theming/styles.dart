import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:accounts_protector/core/helper/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font30BlackPurpleBold = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.blackPurple,
  );

  static TextStyle font15DarkGreySemiBold = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.darkGrey,
  );

  static TextStyle font17BlackPurpleBold = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.blackPurple,
  );

  static TextStyle font17WhiteBold = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static TextStyle font11LightGreyBold = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.lightGrey,
  );

  static TextStyle font14SemiLightBlueBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.lightBlue,
  );
}
