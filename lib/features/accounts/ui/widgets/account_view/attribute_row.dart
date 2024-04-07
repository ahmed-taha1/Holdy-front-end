import 'package:accounts_protector/core/helper/spacing.dart';
import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:accounts_protector/core/theming/styles.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttributeRow extends StatelessWidget {
  final String fieldKey, value;

  const AttributeRow({super.key, required this.fieldKey, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                fieldKey,
                style: TextStyles.font15BlackPurpleSemiBold,
              ),
              horizontalSpace(5),
              Text(
                ":",
                style: TextStyles.font15BlackPurpleMedium,
              ),
              horizontalSpace(5),
              SizedBox(
                width: 170.w,
                child: SelectableText(
                  value,
                  style: TextStyles.font15BlackPurpleMedium,
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.copy_all_rounded, size: 25),
            onPressed: () async {
              FlutterClipboard.copy(value);
            },
            color: AppColors.blackPurple,
          ),
        ],
      ),
    );
  }
}
