import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_app_app_bar_with_back.dart';
import '../../logic/accounts_cubit.dart';
import '../widgets/add_account_view/add_account_view_body.dart';

class AddAccountView extends StatelessWidget {
  const AddAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBack(
        brightness: Brightness.dark,
        statusBarColor: AppColors.white,
        isScrolled: true,
        onPressed: (){
          context.read<AccountsCubit>().resetInputFields();
        },
      ),
      body: const AddAccountViewBody(),
      backgroundColor: AppColors.white,
    );
  }
}
