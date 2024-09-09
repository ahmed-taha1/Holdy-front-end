import 'package:accounts_protector/core/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../../../logic/account_crud_cubit.dart';

class UpdateAccountViewBlocListener extends StatelessWidget {
  const UpdateAccountViewBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountCrudCubit, AccountCrudState>(
      listener: (context, state) {
        if (state is AccountDeletedState) {
          EasyLoading.dismiss();
          context.pop();
          context.pop();
        } else if (state is AccountLoadingState) {
          showCustomLoading();
        } else if (state is AccountUpdatedState) {
          EasyLoading.dismiss();
          context.pop();
        } else if (state is FailedState) {
          EasyLoading.dismiss();
          showSnackBar(context: context, message: state.errorMessage);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
