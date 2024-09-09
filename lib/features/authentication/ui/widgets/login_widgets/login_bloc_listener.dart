import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../../../logic/login/login_cubit.dart';
import '../../../logic/login/login_states.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            showCustomLoading();
          } else if (state is LoginSuccessState) {
            EasyLoading.dismiss();
            context.push(
              Routes.pinView.path,
              extra: () {
                context.pushReplacement(Routes.homeView.path);
              },
            );
          } else if (state is LoginFailureState) {
            EasyLoading.dismiss();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text(state.errorMassage),
              ),
            );
          } else if (state is NoPinState) {
            EasyLoading.dismiss();
            context.go(Routes.createPinView.path);
          }
        },
        child: const SizedBox.shrink());
  }
}
