import 'package:accounts_protector/core/widgets/keyboard_hider.dart';
import 'package:accounts_protector/features/platforms/ui/widgets/platforms_view_widgets/bottom/platforms_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/models/platform.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../accounts/logic/accounts_cubit.dart';

class PlatformsGridView extends StatelessWidget {
  const PlatformsGridView({
    super.key, required this.platforms,
  });

  final List<Platform> platforms;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: KeyboardHider(
        child: GridView.count(
          padding: EdgeInsets.only(bottom: 30.h, left: 30.w, right: 30.w),
          physics: const AlwaysScrollableScrollPhysics(),
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          shrinkWrap: true,
          crossAxisCount: 2,
          children: List.generate(
            platforms.length,
            (index) {
              Platform? platform =
                  platforms[index];
              return PlatformsGridItem(
                platformName: platform.platformName ?? "",
                cardClick: () {
                  context.read<AccountsCubit>().selectedPlatform = platform;
                  context.push(Routes.accountsView.path);
                },
                numOfAccounts: platform.numOfAccounts.toString(),
                colorHexa: platform.iconColor ?? "0",
              );
            },
          ),
        ),
      ),
    );
  }
}
