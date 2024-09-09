import 'package:accounts_protector/features/settings/logic/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/text_styles.dart';
import '../../../core/widgets/custom_app_app_bar_with_back.dart';
import '../../../core/widgets/spacing.dart';
import '../../../core/widgets/view_header.dart';
import 'widgets/app_settings_rows.dart';
import 'widgets/setting_row.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBack(
        isScrolled: true,
        backGroundColor: Theme.of(context).scaffoldBackgroundColor,
        arrowColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ViewHeader(mainText: 'Settings'),
                verticalSpace(40),
                Text(
                  'Account',
                  style: TextStyles.font20BlackPurpleSemiBold.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                verticalSpace(25),
                SettingRow(
                  onTap: () {},
                  prefix: const CircleAvatar(
                    radius: 23,
                    backgroundColor: AppColors.whiteGrey,
                    child: Icon(Icons.person, color: AppColors.lighterGrey),
                  ),
                  title: RichText(
                    text: TextSpan(
                      text:
                      '${context.read<SettingsCubit>().userModel?.firstName} ${context.read<SettingsCubit>().userModel?.lastName}',
                      style: TextStyles.font15BlackPurpleMedium.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                      children: [
                        TextSpan(
                          text: '\nPersonal Info',
                          style: TextStyles.font12RegularDarkGrey.copyWith(
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  suffix: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 22,
                  ),
                ),
                verticalSpace(40),
                Text(
                  'App Settings',
                  style: TextStyles.font20BlackPurpleSemiBold.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                verticalSpace(25),
                const AppSettingsRows(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
