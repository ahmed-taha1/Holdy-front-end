import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/pin_cubit.dart';
import 'number_button.dart';

class NumbersGrid extends StatelessWidget {
  NumbersGrid({super.key});

  final List<int> _numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, -100, 0, -1];

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
            if(_numbers[index] != -1){
              context.read<PinCubit>().addNumber(_numbers[index]);
              print(context.read<PinCubit>().currentPinLength);
            } /*else {
              context.read<PinCubit>().removeNumber();
            }*/
          },
        );
      },
    );
  }
}
