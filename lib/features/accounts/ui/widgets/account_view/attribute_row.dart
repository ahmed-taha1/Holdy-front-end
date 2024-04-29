import 'package:accounts_protector/core/helper/spacing.dart';
import 'package:accounts_protector/core/theming/text_styles.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

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
                style: TextStyles.font15BlackPurpleSemiBold.copyWith(
                    color: Theme.of(context).primaryColor,
                ),
              ),
              horizontalSpace(5),
              Text(
                ":",
                style: TextStyles.font15BlackPurpleMedium.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              horizontalSpace(5),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.54,
                child: SelectableText(
                  value,
                  style: TextStyles.font15BlackPurpleMedium.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.copy_all_rounded, size: 25),
            onPressed: (){
              FlutterClipboard.copy(value);
            },
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
