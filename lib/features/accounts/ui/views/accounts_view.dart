import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_app_app_bar_with_back.dart';
import '../../logic/accounts_cubit.dart';
import '../widgets/accounts_view/accounts_view_body.dart';

class AccountsView extends StatelessWidget {
  const AccountsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBarWithBack(
        arrowColor: AppColors.white,
        backGroundColor: AppColors.purple,
        isScrolled: false,
        onPressed: (){
          context.read<AccountsCubit>().clearSearch();
        },
      ),
      body: const AccountsViewBody(),
      backgroundColor: AppColors.purple,
    );
  }
}
