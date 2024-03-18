import 'package:flutter/material.dart';
import '../widgets/pin_view_widgets/pin_view_body.dart';

class PinView extends StatelessWidget {
  const PinView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: PreferredSize(
      //     preferredSize: Size.fromHeight(40.h),
      //     child: const CustomAppBarWithBack()),
      body: PinViewBody(),
    );
  }
}
