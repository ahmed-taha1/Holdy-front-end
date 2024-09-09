import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class PlatformsShimmerLoading extends StatelessWidget {
  const PlatformsShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.only(bottom: 30.h, left: 30.w, right: 30.w),
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: const Color(0xFFEBEBF4),
            highlightColor: Colors.white,
            child: Container(
              width: 145.w,
              height: 145.h,
              decoration: BoxDecoration(
                color: AppColors.lightViolet,
                borderRadius: BorderRadius.circular(30.r),
              ),
            ),
          );
        },
      ),
    );
  }
}
