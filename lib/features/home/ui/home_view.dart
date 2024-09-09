import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:accounts_protector/features/home/ui/widgets/platforms_shimmer_loading.dart';
import 'package:accounts_protector/features/home/ui/widgets/status_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/models/platform.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/text_styles.dart';
import '../../../core/widgets/custom_text_button.dart';
import '../../../core/widgets/spacing.dart';
import 'widgets/platforms_grid.dart';
import '../logic/home_cubit.dart';
import 'widgets/search_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          color: AppColors.purple,
          child: Column(
            children: [
              const StatusBar(),
              SearchBarWidget(
                onChanged: context.read<HomeCubit>().search,
              ),
              verticalSpace(120),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height,
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
                        padding:
                            EdgeInsets.only(top: 20.h, left: 40.w, right: 40.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Platforms",
                                  style:
                                      TextStyles.font20BlackPurpleBold.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                context.push(Routes.createPlatformView.path);
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
                      BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          if (state is HomeLoading) {
                            return const PlatformsShimmerLoading();
                          } else if (state is HomeSuccessLoad ||
                              state is SearchState ||
                              state is RefreshState) {
                            var platforms = state.props[0];
                            return PlatformsGridView(
                              platforms: platforms as List<Platform>,
                            );
                          } else if (state is HomeFailedLoad) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Home failed to load\nplease check your internet connection\nand try again',
                                  style: TextStyles.font15BlackPurpleMedium
                                      .copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                verticalSpace(20),
                                CustomTextButton(
                                  text: 'Retry',
                                  textStyle: TextStyles.font14SemiLightBlueBold
                                      .copyWith(fontSize: 20.sp),
                                  onPressed: () {
                                    context.read<HomeCubit>().fetchUserData();
                                  },
                                ),
                              ],
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
