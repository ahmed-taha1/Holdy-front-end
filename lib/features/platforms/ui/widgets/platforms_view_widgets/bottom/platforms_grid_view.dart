import 'package:accounts_protector/features/platforms/ui/widgets/platforms_view_widgets/bottom/platforms_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/models/user_model/platform.dart';
import '../../../../logic/platforms/platforms_cubit.dart';

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
        children: List.generate(
          context.read<PlatformsCubit>().userModel?.platforms?.length ?? 0,
          (index) {
            Platform? platform =
                context.read<PlatformsCubit>().userModel?.platforms![index];
            return PlatformsGridItem(
              platformName: platform?.platformName ?? "",
              cardClick: () {
                print("item $index clicked");
              },
              numOfAccounts: platform?.numOfAccounts.toString() ?? "0",
              colorHexa: platform?.iconColor ?? "0",
            );
          },
        ),
      ),
    );
  }
}
