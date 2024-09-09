import 'package:accounts_protector/core/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../../../logic/platform_crud_cubit.dart';

class CreatePlatformViewBlocListener extends StatelessWidget {
  const CreatePlatformViewBlocListener({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<PlatformCrudCubit, PlatformCrudState>(
      listener: (context, state) {
        if (state is PlatformCrudCreateSuccess) {
          EasyLoading.dismiss();
          context.pop();
        } else if (state is PlatformCrudLoadingState) {
          showCustomLoading();
        } else if (state is PlatformCrudCreateFailure) {
          EasyLoading.dismiss();
          showSnackBar(context: context, message: state.errorMessage);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}