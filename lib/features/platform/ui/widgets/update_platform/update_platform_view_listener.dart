import 'package:accounts_protector/core/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../../../logic/platform_crud_cubit.dart';

class UpdatePlatformViewListener extends StatelessWidget {
  const UpdatePlatformViewListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PlatformCrudCubit, PlatformCrudState>(
        listener: (context, state) {
      if (state is PlatformCrudUpdateSuccess) {
        EasyLoading.dismiss();
        context.pop();
      } else if (state is PlatformCrudDeleteFailure) {
        EasyLoading.dismiss();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      } else if (state is PlatformCrudLoadingState) {
        showCustomLoading();
      } else if (state is PlatformCrudUpdateFailure) {
        EasyLoading.dismiss();
        showSnackBar(context: context, message: state.errorMessage);
      } else if (state is PlatformCrudDeleteSuccess) {
        EasyLoading.dismiss();
        context.pop();
        context.pop();
      }
    },
      child: const SizedBox.shrink(),
    );
  }
}
