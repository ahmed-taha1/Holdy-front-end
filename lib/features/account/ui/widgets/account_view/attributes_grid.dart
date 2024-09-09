import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/account_attribute_for_ui.dart';
import 'attribute_row.dart';

class AttributesGrid extends StatelessWidget {
  final List<AccountAttributeForUi> attributes;

  const AttributesGrid({super.key, required this.attributes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // physics: const BouncingScrollPhysics(),
      itemCount: attributes.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: AttributeRow(
            attribute: attributes[index],
          ),
        );
      },
    );
  }
}
