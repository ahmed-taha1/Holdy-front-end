import 'dart:math';

import 'package:accounts_protector/core/helper/spacing.dart';
import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Circles extends StatelessWidget {
  const Circles({super.key, required this.numOfLightCircles});
  final int numOfLightCircles;
  final int _numOfCircles = 6;
  @override
  Widget build(BuildContext context) {
    List<Widget> circles = [];
    for(int i = 0; i < min(_numOfCircles, numOfLightCircles); i++){
      circles.add(const Circle(isOn: true));
      circles.add(horizontalSpace(14.h));
    }
    for(int i = 0; i < _numOfCircles - numOfLightCircles; i++){
      circles.add(const Circle(isOn: false));
      circles.add(horizontalSpace(14.h));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: circles,
    );
  }
}

class Circle extends StatelessWidget {
  const Circle({super.key, required this.isOn});
  final bool isOn;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: isOn ? AppColors.purple : null,
        border: isOn ? null : Border.all(
          color: AppColors.blackPurple,
          width: 0.7,
        ),
      ),
    );
  }
}
