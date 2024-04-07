import 'package:accounts_protector/core/helper/spacing.dart';
import 'package:flutter/material.dart';

class SettingRow extends StatelessWidget {
  const SettingRow(
      {super.key,
      required this.prefix,
      required this.suffix,
      required this.title,
      this.onTap});

  final Widget prefix;
  final Widget suffix;
  final Widget title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              prefix,
              horizontalSpace(20),
              title,
            ],
          ),
          suffix,
        ],
      ),
    );
  }
}
