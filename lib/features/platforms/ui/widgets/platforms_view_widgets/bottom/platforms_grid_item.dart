import 'package:accounts_protector/core/helper/font_weight_helper.dart';
import 'package:accounts_protector/core/helper/spacing.dart';
import 'package:flutter/cupertino.dart';
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
    return GestureDetector(
      onTap: cardClick,
      child: Card(
        elevation: 4,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Color(
              int.parse(colorHexa, radix: 16),
            ),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 14.h, left: 1.w, right: 1.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(int.parse(colorHexa, radix: 16)),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Text(
                  platformInitial,
                  style: TextStyles.font26WhiteBold,
                ),
              ),
              verticalSpace(5),
              Flexible(
                child: Text(
                  platformName,
                  textAlign: TextAlign.center,
                  style: TextStyles.font15BlackPurpleMedium.copyWith(
                    fontFamily: FontWeightHelper.semiBold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                "$numOfAccounts Accounts",
                style: TextStyles.font11DarkGreyRegular,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
