import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:accounts_protector/features/platforms/logic/platforms/platforms_cubit.dart';
import 'package:accounts_protector/features/platforms/ui/widgets/platforms_view_widgets/top/top_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/models/platform.dart';
import 'bottom/bottom_part.dart';

class PlatformsViewBody extends StatelessWidget {
  const PlatformsViewBody({super.key, required this.platforms});

  final List<Platform> platforms;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.purple,
        child: Column(
          children: [
            TopPart(
              username:
                  context.read<PlatformsCubit>().userModel?.firstName ?? '',
            ),
            BottomPart(
              platforms: platforms,
            ),
          ],
        ),
      ),
    );
  }
}
