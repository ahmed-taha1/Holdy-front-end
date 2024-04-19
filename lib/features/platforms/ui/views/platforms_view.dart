import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:accounts_protector/features/platforms/logic/platforms/platforms_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../splash_screen/splash_screen.dart';
import '../widgets/platforms_view_widgets/platforms_view_body.dart';

class PlatformsView extends StatelessWidget {
  const PlatformsView({super.key});

  @override
  Widget build(BuildContext context) {
    Color backGroundColor = AppColors.purple;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.blackPurple,
      appBar: CustomAppBar(
        backGroundColor: backGroundColor,
      ),
      body: BlocBuilder<PlatformsCubit, PlatformsState>(
        builder: (context, state) {
          if (state is PlatformLoadingState) {
            return const SplashScreen();
          } else if (state is DataFetchFailure) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          } else if (state is SearchPlatformState) {
            return PlatformsViewBody(platforms: state.filteredPlatforms);
          } else {
            return PlatformsViewBody(
              platforms:
                  context.read<PlatformsCubit>().userModel?.platforms ?? [],
            );
          }
        },
      ),
    );
  }
}
