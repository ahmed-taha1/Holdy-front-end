import 'package:accounts_protector/core/widgets/custom_app_app_bar_with_back.dart';
import 'package:flutter/material.dart';

import 'help_view_body.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBack(
        backGroundColor: Theme.of(context).scaffoldBackgroundColor,
        arrowColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const HelpViewBody(),
    );
  }
}
