import 'package:accounts_protector/core/theming/styles.dart';
import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  const NumberButton({super.key, required this.number, required this.onPressed});

  final int number;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      width: 10,
      child: TextButton(
        onPressed: onPressed,
        child: number == -1
            ? const Icon(Icons.backspace_outlined)
            : Text(number.toString(), style: TextStyles.font30BlackPurpleBold),
      ),
    );
  }
}
