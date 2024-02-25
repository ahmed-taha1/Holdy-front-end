import 'package:accounts_protector/features/platforms/ui/widgets/platforms_grid_item.dart';
import 'package:flutter/material.dart';

class PlatformsGridView extends StatelessWidget {
  const PlatformsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: GridView.count(
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
      ),
    );
  }
}
