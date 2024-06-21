import 'package:accounts_protector/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/pin_view_widgets/pin_view_body.dart';

class PinView extends StatelessWidget {
  const PinView({super.key, required this.onSuccessCallback});

  final VoidCallback onSuccessCallback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          backGroundColor: Theme.of(context).scaffoldBackgroundColor),
      body: PinViewBody(onSuccessCallback: onSuccessCallback),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
