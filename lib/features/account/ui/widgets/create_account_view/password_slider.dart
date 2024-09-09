import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


Future<int> showSliderDialog(BuildContext context) async{
  double sliderValue = 10;
  await showDialog(
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
              sliderValue = -1;
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
  return sliderValue.toInt();
}
