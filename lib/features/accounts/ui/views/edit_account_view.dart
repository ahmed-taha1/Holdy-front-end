import 'package:accounts_protector/core/widgets/custom_app_app_bar_with_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/accounts_cubit.dart';
import '../widgets/edit_account_view/edit_account_view_body.dart';

class EditAccountView extends StatelessWidget {
  const EditAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: CustomAppBarWithBack(
        isScrolled: true,
        backGroundColor: Theme.of(context).scaffoldBackgroundColor,
        arrowColor: Theme.of(context).primaryColor,
        onPressed: (){
          context.read<AccountsCubit>().resetInputFields();
        },
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const EditAccountViewBody(),
    );
  }
}
