import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_app_app_bar_with_back.dart';
import '../widgets/account_view/account_view_body.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarWithBack(
          backGroundColor: AppColors.purple,
          arrowColor: AppColors.white,
          brightness: Brightness.light,
          statusBarColor: AppColors.purple,
      ),
      body: AccountViewBody(),
      backgroundColor: AppColors.purple,
    );
  }
}
