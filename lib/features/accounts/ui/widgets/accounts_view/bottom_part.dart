import 'package:accounts_protector/core/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/models/platform.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/styles.dart';
import 'accounts_grid.dart';

class BottomPart extends StatelessWidget {
  const BottomPart({super.key, required this.platform});

  final Platform platform;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Positioned.fill(
            top: 60.h,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  verticalSpace(20),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35.w),
                      child: IconButton(
                        onPressed: () {
                          context.push(Routes.addAccountView.path);
                        },
                        icon: const Icon(
                          size: 30,
                          Icons.add,
                          color: AppColors.blackPurple,
                        ),
                      ),
                    ),
                  ),
                  verticalSpace(40),
                  AccountsGrid(
                    accounts: platform.accounts!,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 125.h,
              width: 125.w,
              decoration: BoxDecoration(
                color: Color(int.parse(platform.iconColor!, radix: 16)),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Center(
                child: Text(
                  platform.platformName![0],
                  style: TextStyles.font20WhiteBold.copyWith(fontSize: 70.sp),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
