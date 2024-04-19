import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomAppBarWithBack extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWithBack({
    super.key,
    this.arrowColor = AppColors.blackPurple,
    this.isScrolled = false,
    this.onPressed, required this.backGroundColor,
  });

  final VoidCallback? onPressed;
  final Color backGroundColor;
  final Color arrowColor;
  final bool isScrolled;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.black26,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      scrolledUnderElevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: 20.w, top: 10.h),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: Icon(
            Icons.arrow_back_ios,
            color: arrowColor,
          ),
          onTap: () {
            context.pop();
            onPressed?.call();
          },
        ),
      ),
      backgroundColor: backGroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(45);
}
