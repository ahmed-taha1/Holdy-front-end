import 'package:accounts_protector/core/widgets/custom_app_bar.dart';
import 'package:accounts_protector/features/pin/ui/widgets/create_pin_widgets/create_pin_view_body.dart';
import 'package:flutter/material.dart';

class CreatePinView extends StatelessWidget {
  const CreatePinView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //     preferredSize: Size.fromHeight(40.h),
      //     child: const CustomAppBarWithBack()),
      appBar: CustomAppBar(
        backGroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: const CreatePinViewBody(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
