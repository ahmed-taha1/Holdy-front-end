import 'package:accounts_protector/features/accounts/ui/widgets/account_view/attribute_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/pair.dart';

class AttributesGrid extends StatelessWidget {
  final List<Pair<String, String>> attributes;

  const AttributesGrid({super.key, required this.attributes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: attributes.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: AttributeRow(
              fieldKey: attributes[index].key,
              value: attributes[index].value),
        );
      },
    );
  }
}
