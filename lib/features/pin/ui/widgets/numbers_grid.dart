import 'package:accounts_protector/features/pin/logic/pin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/routes.dart';
import '../../logic/create_pin_cubit.dart';
import 'shared/number_button.dart';

class NumbersGrid extends StatelessWidget {
  NumbersGrid({super.key, this.isCreatePin = true});

  final List<int> _numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, -100, 0, -1];

  final bool isCreatePin;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _numbers.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1,
        crossAxisCount: 3,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
      itemBuilder: (BuildContext context, int index) {
        if (index == 9) {
          return const SizedBox();
        }
        return NumberButton(
          number: _numbers[index],
          onPressed: () {
            // not remove number
            if (_numbers[index] != -1) {
              if(!isCreatePin) {
                context.read<PinCubit>().addNumber(_numbers[index]);
                return;
              }
              if (context.read<CreatePinCubit>().confirmPin == '') {
                context.read<CreatePinCubit>().addNumber(_numbers[index]);
              } else {
                context.read<CreatePinCubit>().addConfirmPinNumber(_numbers[index]);
              }
              if (context.read<CreatePinCubit>().isConfirm) {
                context.go(Routes.loginView.path);
              }
            } else {
              if(!isCreatePin) {
                context.read<PinCubit>().removeNumber();
                return;
              }
              context.read<CreatePinCubit>().removeNumber();
            }
          },
        );
      },
    );
  }
}
