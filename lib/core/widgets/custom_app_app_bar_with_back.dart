import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomAppBarWithBack extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWithBack(
      {super.key,
      this.backGroundColor = AppColors.white,
      this.arrowColor = AppColors.blackPurple,
      required this.brightness,
      required this.statusBarColor,
      this.isScrolled = false,
      this.onPressed});

  final VoidCallback? onPressed;
  final Color backGroundColor;
  final Color arrowColor;
  final Brightness brightness;
  final Color statusBarColor;
  final bool isScrolled;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        statusBarBrightness: brightness,
        statusBarIconBrightness: brightness,
      ),
      scrolledUnderElevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(bottom: 5.h),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () {
              context.pop();
              onPressed?.call();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: arrowColor,
            ),
          ),
        ),
      ),
      backgroundColor: backGroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(45);
}
