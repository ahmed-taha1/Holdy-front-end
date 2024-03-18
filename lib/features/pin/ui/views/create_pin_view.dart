import 'package:accounts_protector/features/pin/ui/widgets/create_pin_widgets/create_pin_view_body.dart';
import 'package:flutter/material.dart';


class CreatePinView extends StatelessWidget {
  const CreatePinView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: PreferredSize(
      //     preferredSize: Size.fromHeight(40.h),
      //     child: const CustomAppBarWithBack()),
      body: CreatePinViewBody(),
    );
  }
}
