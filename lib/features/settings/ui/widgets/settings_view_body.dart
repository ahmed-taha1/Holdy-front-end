import 'package:accounts_protector/core/helper/spacing.dart';
import 'package:accounts_protector/core/routing/routes.dart';
import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:accounts_protector/core/theming/text_styles.dart';
import 'package:accounts_protector/core/widgets/view_header.dart';
import 'package:accounts_protector/features/platforms/logic/platforms/platforms_cubit.dart';
import 'package:accounts_protector/features/settings/logic/settings_cubit.dart';
import 'package:accounts_protector/features/settings/ui/widgets/setting_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'app_settings_rows.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          context.go(Routes.loginView.path);
        }
      },
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
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
                          '${context.read<PlatformsCubit>().userModel!.firstName} ${context.read<PlatformsCubit>().userModel?.lastName ?? ''}',
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
