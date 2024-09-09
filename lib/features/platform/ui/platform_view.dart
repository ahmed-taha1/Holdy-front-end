import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:accounts_protector/features/home/ui/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/routing/routes.dart';
import '../../../core/widgets/custom_app_app_bar_with_back.dart';
import '../../../core/widgets/spacing.dart';
import '../logic/platform_cubit.dart';
import 'widgets/platform_view/bottom_part.dart';
import 'widgets/platform_view/top_part.dart';

class PlatformView extends StatelessWidget {
  const PlatformView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const CustomAppBarWithBack(
        arrowColor: AppColors.white,
        backGroundColor: AppColors.purple,
        isScrolled: false,
      ),
      backgroundColor: AppColors.purple,

      body: BlocBuilder<PlatformCubit, PlatformState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.h),
                child: TopPart(
                  title: context.read<PlatformCubit>().platform.platformName ?? "",
                  onPressed: (){
                    context.push(Routes.updatePlatformView.path, extra: context.read<PlatformCubit>().platform);
                  },
                ),
              ),
              verticalSpace(35),
              SearchBarWidget(
                onChanged: context.read<PlatformCubit>().search,
              ),
              verticalSpace(40),
              BottomPart(
                platform: context.read<PlatformCubit>().platform,
              ),
            ],
          );
        },
      ),
    );
  }
}