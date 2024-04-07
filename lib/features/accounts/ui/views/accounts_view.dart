import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_app_app_bar_with_back.dart';
import '../widgets/accounts_view/accounts_view_body.dart';

class AccountsView extends StatelessWidget {
  const AccountsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarWithBack(
        backGroundColor: AppColors.purple,
        arrowColor: AppColors.white,
        brightness: Brightness.light,
        statusBarColor: AppColors.purple,
        isScrolled: false,
      ),
      body: AccountsViewBody(),
      backgroundColor: AppColors.purple,
    );
  }
}
