import 'package:accounts_protector/core/theming/styles.dart';
import 'package:accounts_protector/features/settings/logic/settings_cubit.dart';
import 'package:accounts_protector/features/settings/ui/widgets/setting_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/app_colors.dart';

class AppSettingsRows extends StatelessWidget {
  const AppSettingsRows({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingRow(
          prefix: CircleAvatar(
            radius: 22.r,
            backgroundColor: const Color(0xFFFFDED0),
            child: const Icon(
              Icons.public,
              size: 19,
              color: Color(0xFFE88E5A),
            ),
          ),
          title: Text(
            'Language',
            style: TextStyles.font15BlackPurpleMedium,
          ),
          suffix: Row(
            children: [
              Text(
                'English',
                style: TextStyles.font15DarkGreySemiBold,
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.blackPurple,
                size: 22,
              )
            ],
          ),
        ),
        verticalSpace(25),
        SettingRow(
          prefix: CircleAvatar(
            radius: 22.r,
            backgroundColor: const Color(0xFFE9DCFF),
            child: const Icon(
              Icons.dark_mode_rounded,
              size: 19,
              color: Color(0xFF4026C8),
            ),
          ),
          title: Text(
            'Dark Mode',
            style: TextStyles.font15BlackPurpleMedium,
          ),
          suffix: Transform.scale(
            scale: 0.9,
            child: Switch(
              value: context
                  .read<SettingsCubit>()
                  .isDark!,
              activeTrackColor: AppColors.purple,
              onChanged: (value) {
                context.read<SettingsCubit>().changeTheme();
              },
            ),
          ),
        ),
        verticalSpace(25),
        SettingRow(
          prefix: CircleAvatar(
            radius: 22.r,
            backgroundColor: const Color(0xFFFFCDDA),
            child: const Icon(
              Icons.help,
              size: 19,
              color: Color(0xFFCF3A60),
            ),
          ),
          title: Text(
            'Help',
            style: TextStyles.font15BlackPurpleMedium,
          ),
          suffix: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.blackPurple,
            size: 22,
          ),
        ),
        verticalSpace(25),
        SettingRow(
          onTap: () {
            context.read<SettingsCubit>().logout();
          },
          prefix: CircleAvatar(
            radius: 22.r,
            backgroundColor: const Color(0xFFFFD2D2),
            child: const Icon(
              Icons.logout_rounded,
              size: 19,
              color: Color(0xFFFF0000),
            ),
          ),
          title: Text(
            'Log Out',
            style: TextStyles.font15BlackPurpleMedium,
          ),
          suffix: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.blackPurple,
            size: 22,
          ),
        ),
      ],
    );
  }
}
