import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_app_bar_with_back.dart';
import '../widgets/edit_platform_widgets/edit_platform_body.dart';

class EditPlatformView extends StatelessWidget {
  const EditPlatformView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: CustomAppBarWithBack(
        isScrolled: true,
        backGroundColor: Theme.of(context).scaffoldBackgroundColor,
        arrowColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const EditPlatformViewBody(),
    );
  }
}
