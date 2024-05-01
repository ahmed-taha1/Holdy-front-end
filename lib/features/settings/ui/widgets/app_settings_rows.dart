import 'package:accounts_protector/core/theming/app_theme.dart';
import 'package:accounts_protector/core/theming/text_styles.dart';
import 'package:accounts_protector/core/theming/logic/theme_bloc.dart';
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
          onTap: () {},
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
            style: TextStyles.font15BlackPurpleMedium.copyWith(
              color: Theme.of(context).primaryColor,
            ),
          ),
          suffix: Row(
            children: [
              Text(
                'English',
                style: TextStyles.font15DarkGreySemiBold.copyWith(
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Theme.of(context).primaryColor,
                size: 22,
              )
            ],
          ),
        ),
        verticalSpace(25),
        BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return SettingRow(
              onTap: () {},
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
                style: TextStyles.font15BlackPurpleMedium.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              suffix: Transform.scale(
                scale: 0.9,
                child: BlocBuilder<ThemeBloc, ThemeState>(
                  builder: (context, state) {
                    return Switch(
                      value: context.read<ThemeBloc>().isDark,
                      activeTrackColor: AppColors.purple,
                      onChanged: (value) {
                        debugPrint('Dark Mode: ${context.read<ThemeBloc>().isDark}');
                        final isDark = context.read<ThemeBloc>().isDark;
                        context.read<ThemeBloc>().add(
                              ThemeChangedEvent(
                                isDark ? AppTheme.light : AppTheme.dark,
                              ),
                            );
                      },
                    );
                  },
                ),
              ),
            );
          },
        ),
        verticalSpace(25),
        SettingRow(
          onTap: () {},
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
            style: TextStyles.font15BlackPurpleMedium.copyWith(
                color: Theme.of(context).primaryColor,
            ),
          ),
          suffix: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Theme.of(context).primaryColor,
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
            style: TextStyles.font15BlackPurpleMedium.copyWith(
              color: Theme.of(context).primaryColor,
            ),
          ),
          suffix: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Theme.of(context).primaryColor,
            size: 22,
          ),
        ),
      ],
    );
  }
}
