import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:accounts_protector/features/platforms/logic/platforms/platforms_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../splash_screen/splash_screen.dart';
import '../widgets/platforms_view_widgets/platforms_view_body.dart';

class PlatformsView extends StatelessWidget {
  const PlatformsView({super.key});
  @override
  Widget build(BuildContext context) {
    Color statusBarColor = AppColors.purple;
    Brightness statusBarIconBrightness = Brightness.light;
    Brightness statusBarBrightness = Brightness.light;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.purple,
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarBrightness: statusBarBrightness,
          statusBarColor: statusBarColor,
          statusBarIconBrightness: statusBarIconBrightness,
        ),
        child: BlocBuilder<PlatformsCubit, PlatformsState>(
          builder: (context, state) {
            if (state is LoadingState) {
              statusBarColor = AppColors.white;
              statusBarIconBrightness = Brightness.dark;
              statusBarBrightness = Brightness.dark;
              return const SplashScreen();
            } else if (state is DataFetchFailure) {
              statusBarColor = AppColors.white;
              statusBarIconBrightness = Brightness.dark;
              statusBarBrightness = Brightness.dark;
              return const SplashScreen();
            } else if (state is SearchPlatformState) {
              statusBarColor = AppColors.purple;
              statusBarIconBrightness = Brightness.light;
              statusBarBrightness = Brightness.light;
              return PlatformsViewBody(platforms: state.filteredPlatforms);
            }
            else {
              statusBarColor = AppColors.purple;
              statusBarIconBrightness = Brightness.light;
              statusBarBrightness = Brightness.light;
              return PlatformsViewBody(platforms: context.read<PlatformsCubit>().userModel?.platforms ?? []);
            }
          },
        ),
      ),
    );
  }
}
