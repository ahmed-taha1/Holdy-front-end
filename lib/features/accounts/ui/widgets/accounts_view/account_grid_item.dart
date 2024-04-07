import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:accounts_protector/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountGridItem extends StatelessWidget {
  const AccountGridItem({super.key, required this.onPressed, required this.accountName});

  final VoidCallback onPressed;
  final String accountName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 18.h),
        decoration: BoxDecoration(
          color: AppColors.veryLightCyan,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFA4EAFF).withOpacity(0.66),
              blurRadius: 7,
              offset: const Offset(4, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                accountName,
                style: TextStyles.font15BlackPurpleSemiBold,
              ),
            ),
            const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.blackPurple,
                size: 25,
              ),
          ],
        ),
      ),
    );
  }
}
