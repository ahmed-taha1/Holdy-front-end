import 'package:accounts_protector/core/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/theming/styles.dart';

class PlatformsGridItem extends StatelessWidget {
  PlatformsGridItem({
    super.key,
    required this.cardClick,
    required this.platformName,
    required this.numOfAccounts,
    required this.colorHexa,
  }) {
    platformInitial = platformName[0].toUpperCase();
  }

  final VoidCallback cardClick;
  final String platformName;
  final String numOfAccounts;
  late final String platformInitial;
  final String colorHexa;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: cardClick,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Color(int.parse(colorHexa, radix: 16)),
        fixedSize: Size(145.w, 145.h),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 14.h, left: 1.w, right: 1.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              platformInitial,
              style: TextStyles.font26WhiteBold.copyWith(fontSize: 40.sp),
            ),
            verticalSpace(5),
            Flexible(
              child: Text(
                platformName,
                textAlign: TextAlign.center,
                style: TextStyles.font15WhiteSemiBold,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              "$numOfAccounts Accounts",
              style: TextStyles.font11WhiteSemiBold.copyWith(
                color: const Color(0xffF2F2F2),
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(0, 1),
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
