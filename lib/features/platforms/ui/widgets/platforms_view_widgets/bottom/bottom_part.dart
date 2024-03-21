import 'package:accounts_protector/core/helper/spacing.dart';
import 'package:accounts_protector/core/routing/app_router.dart';
import 'package:accounts_protector/core/routing/routes.dart';
import 'package:accounts_protector/features/platforms/ui/widgets/platforms_view_widgets/bottom/platforms_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/styles.dart';

class BottomPart extends StatelessWidget {
  const BottomPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.h, left: 40.w, right: 40.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Platforms",
                        style: TextStyles.font20BlackPurpleBold,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      context.push(Routes.addPlatformView.path);
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
