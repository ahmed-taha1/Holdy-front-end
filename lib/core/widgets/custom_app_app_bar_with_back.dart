import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomAppBarWithBack extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBarWithBack({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          context.pop();
        },
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 40.h,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
