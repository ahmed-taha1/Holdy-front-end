import 'package:accounts_protector/core/widgets/spacing.dart';
import 'package:flutter/material.dart';

class SettingRow extends StatelessWidget {
  const SettingRow({
    super.key,
    required this.prefix,
    required this.suffix,
    required this.title,
    required this.onTap,
    this.isEnabled = true,
  });

  final Widget prefix;
  final Widget suffix;
  final Widget title;
  final VoidCallback onTap;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        
      ),
      onPressed: onTap,
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
