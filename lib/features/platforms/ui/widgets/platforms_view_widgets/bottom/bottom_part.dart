import 'package:accounts_protector/core/helper/spacing.dart';
import 'package:accounts_protector/features/platforms/ui/widgets/platforms_view_widgets/bottom/platforms_grid_view.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/styles.dart';

class BottomPart extends StatelessWidget {
  const BottomPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Platforms",
                          style: TextStyles.font20BlackPurpleBold),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      print("add clicked");
                    },
                    icon: const Icon(
                      Icons.add,
                      color: AppColors.blackPurple,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(10),
            const PlatformsGridView(),
          ],
        ),
      ),
    );
  }
}
