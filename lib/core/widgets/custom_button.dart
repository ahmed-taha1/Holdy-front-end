import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/app_colors.dart';
import '../theming/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor = AppColors.purple,
  }) : super(key: key);

  final bool isLoading;
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 240.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: -13,
            blurRadius: 12.5,
            offset: const Offset(13, 16),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: isLoading ? () {} : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: isLoading
              ? CircularProgressIndicator(
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(AppColors.white),
                  strokeWidth: 2.w,
                )
              : Text(
                  text,
                  style: TextStyles.font17WhiteBold,
                ),
        ),
      ),
    );
  }
}
