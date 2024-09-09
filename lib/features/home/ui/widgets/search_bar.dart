import 'package:accounts_protector/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/theming/app_colors.dart';

class SearchBarWidget extends StatelessWidget {
  final void Function(String) onChanged;
  const SearchBarWidget({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          color: AppColors.lightPurple,
        ),
        child: Padding(
          padding: const EdgeInsets.all(6).add(EdgeInsets.only(left: 8.h)),
          child: TextField(
            style: TextStyles.font15WhiteSemiBold,
            cursorColor: AppColors.white,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search",
              hintStyle: TextStyles.font15WhiteSemiBold,
              icon: const Icon(
                Icons.search,
                color: AppColors.white,
              ),
            ),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
