
import 'package:accounts_protector/features/accounts/logic/accounts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void showSliderDialog(BuildContext context) {
  double sliderValue = 10;
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Select password length"),
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Slider(
                  value: sliderValue,
                  min: 1,
                  max: 50,
                  divisions: 50,
                  label: sliderValue.toInt().toString(),
                  onChanged: (newValue) {
                    setState(() {
                      sliderValue = newValue; // Update the slider value
                    });
                  },
                ),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              context.read<AccountsCubit>().createRandomPassword(sliderValue.toInt());
              context.pop();
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}
