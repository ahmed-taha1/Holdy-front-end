import 'package:accounts_protector/core/helper/spacing.dart';
import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:accounts_protector/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconWithTopText extends StatelessWidget {
  const IconWithTopText(
      {super.key, required this.title, required this.addWarning});

  final String title;
  final bool addWarning;

  @override
  Widget build(BuildContext context) {
    final Widget warningWidget;
    if (addWarning) {
      warningWidget = Column(
        children: [
          verticalSpace(8),
          Text(
            'PIN is not changeable and not forgettable,\nso make sure to save it in a secure place\nor keep remember it',
            style: TextStyles.font12RedBold,
            textAlign: TextAlign.center,
          ),
        ],
      );
    } else {
      warningWidget = const SizedBox();
    }

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.purple,
          ),
          width: 60.w,
          height: 60.h,
          child: const Icon(
            Icons.lock_outline,
            color: AppColors.white,
            size: 30,
          ),
        ),
        verticalSpace(18),
        Text(title, style: TextStyles.font20BlackPurpleBold),
        warningWidget,
      ],
    );
  }
}
