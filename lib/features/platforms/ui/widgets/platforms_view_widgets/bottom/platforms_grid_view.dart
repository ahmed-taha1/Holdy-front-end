import 'package:accounts_protector/features/platforms/ui/widgets/platforms_view_widgets/bottom/platforms_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlatformsGridView extends StatelessWidget {
  const PlatformsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        padding: EdgeInsets.only(bottom: 30.h, left: 30.w, right: 30.w),
        physics: const BouncingScrollPhysics(),
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        shrinkWrap: true,
        crossAxisCount: 2,
        children: List.generate(11, (index) {
          return PlatformsGridItem(
              platformName: "Facebook",
              cardClick: () {
                print("item $index clicked");
              });
        }),
      ),
    );
  }
}
