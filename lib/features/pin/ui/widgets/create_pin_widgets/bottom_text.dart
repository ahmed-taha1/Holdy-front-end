import 'package:accounts_protector/core/theming/styles.dart';
import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  const BottomText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Tip: use 6 unforgettable numbers\n'
      'ex: first 6 numbers of your phone number,\n'
      'first 6 numbers of your id,\n'
      'your birth date',
      style: TextStyles.font11LightGreyBold.copyWith(fontSize: 12),
      textAlign: TextAlign.center,
    );
  }
}
