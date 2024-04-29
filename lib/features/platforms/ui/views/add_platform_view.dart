import 'package:accounts_protector/features/platforms/ui/widgets/add_platform_view_widgets/add_platform_view_body.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_app_bar_with_back.dart';

class AddPlatformView extends StatelessWidget {
  const AddPlatformView({super.key});

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
      body: const AddPlatformViewBody(),
    );
  }
}
