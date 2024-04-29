import 'package:accounts_protector/core/helper/spacing.dart';
import 'package:accounts_protector/core/routing/routes.dart';
import 'package:accounts_protector/features/platforms/ui/widgets/platforms_view_widgets/bottom/platforms_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/models/platform.dart';
import '../../../../../../core/theming/text_styles.dart';

class BottomPart extends StatelessWidget {
  const BottomPart({
    super.key,
    required this.platforms,
  });

  final List<Platform> platforms;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
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
                        style: TextStyles.font20BlackPurpleBold.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      context.push(Routes.addPlatformView.path);
                    },
                    icon: Icon(
                      Icons.add,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(10),
            PlatformsGridView(
              platforms: platforms,
            ),
          ],
        ),
      ),
    );
  }
}
