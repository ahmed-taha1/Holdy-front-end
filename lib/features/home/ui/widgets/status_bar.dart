import 'package:accounts_protector/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../logic/home_cubit.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    String date = DateFormat('dd MMM, yyyy').format(DateTime.now());
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.only(top: 30.h, bottom: 20.h, left: 40.w, right: 40.w),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading || state is HomeFailedLoad) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        state is HomeLoading
                            ? Shimmer.fromColors(
                                baseColor: const Color(0xFFEBEBF4),
                                highlightColor: AppColors.white,
                                child: Container(
                                  width: 80.w,
                                  height: 21.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.lighterGrey,
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                ),
                              )
                            : Text(
                                "Hi, ",
                                style: TextStyles.font17WhiteBold,
                              ),
                        // Text("Hi, Taha", style: TextStyles.font17WhiteBold),
                        verticalSpace(10),
                        Text(date, style: TextStyles.font13WhiteRegular)
                      ],
                    ),
                  ],
                );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Hi, ${context.read<HomeCubit>().userModel.firstName}",
                            style: TextStyles.font17WhiteBold),
                        // Text("Hi, Taha", style: TextStyles.font17WhiteBold),
                        verticalSpace(10),
                        Text(date, style: TextStyles.font13WhiteRegular),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        context.push(Routes.settingsView.path);
                      },
                      icon: const Icon(
                        Icons.settings,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
