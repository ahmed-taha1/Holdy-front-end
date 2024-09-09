import 'package:accounts_protector/features/home/ui/widgets/platforms_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/models/platform.dart';
import '../../../../core/routing/routes.dart';

class PlatformsGridView extends StatelessWidget {
  const PlatformsGridView({
    super.key, required this.platforms,
  });

  final List<Platform> platforms;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
          padding: EdgeInsets.only(bottom: 30.h, left: 30.w, right: 30.w),
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
          ),
          itemCount: platforms.length,
          itemBuilder: (context, index) {
            Platform platform = platforms[index];
            return PlatformsGridItem(
              platformName: platform.platformName ?? "",
              cardClick: () {
                context.push(Routes.platformView.path, extra: platforms[index]);
              },
              numOfAccounts: platform.numOfAccounts.toString(),
              colorHexa: platform.iconColor ?? "0",
            );
          },
        ),
    );
  }
}
