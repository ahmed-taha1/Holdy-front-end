import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../../../../../core/widgets/snack_bar.dart';
import '../../../logic/register/register_cubit.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          showCustomLoading();
        } else if (state is RegisterSuccessState) {
          EasyLoading.dismiss();
          context.go(Routes.createPinView.path);
        } else if (state is RegisterFailureState) {
          EasyLoading.dismiss();
          showSnackBar(context: context, message: state.errorMassage);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
