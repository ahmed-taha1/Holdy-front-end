import 'package:flutter/material.dart';

import '../../core/widgets/view_header.dart';

class HelpViewBody extends StatelessWidget {
  const HelpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ViewHeader(mainText: 'Help'),
            RichText(
              text: TextSpan(
                text: 'If you need help, please contact us at\n',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ]
        )
      ),
    );
  }
}
