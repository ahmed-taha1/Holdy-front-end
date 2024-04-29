import 'package:accounts_protector/core/theming/text_styles.dart';
import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  const NumberButton(
      {super.key, required this.number, required this.onPressed});

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
            ? Icon(
                Icons.backspace_outlined,
                color: Theme.of(context).primaryColor,
              )
            : Text(
                number.toString(),
                style: TextStyles.font30BlackPurpleBold.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
      ),
    );
  }
}
