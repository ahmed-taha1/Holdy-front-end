import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/app_colors.dart';
import '../theming/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isEnabled = false,
  }) : super(key: key);

  final bool isEnabled;
  final String text;
  final VoidCallback onPressed;

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
        onPressed: isEnabled ? (){} : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: isEnabled ? const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
          ) : Text(
            text,
            style: TextStyles.font17WhiteBold,
          ),
        ),
      ),
    );
  }
}
