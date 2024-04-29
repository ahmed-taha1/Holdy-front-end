import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:accounts_protector/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountGridItem extends StatelessWidget {
  const AccountGridItem({super.key, required this.onPressed, required this.accountName, required this.color});

  final VoidCallback onPressed;
  final String accountName;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 18.h),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              accountName,
              style: TextStyles.font15WhiteSemiBold,
            ),
          ),
          const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.white,
              size: 25,
            ),
        ],
      ),
    );
  }
}
