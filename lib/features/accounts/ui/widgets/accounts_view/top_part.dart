import 'package:flutter/material.dart';
import '../../../../../core/theming/styles.dart';

class TopPart extends StatelessWidget {
  const TopPart({super.key, required this.title, required this.onPressed});

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyles.font20WhiteBold,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.edit_rounded,
            color: Colors.white,
            size: 25,
          ),
        ),
      ],
    );
  }
}
