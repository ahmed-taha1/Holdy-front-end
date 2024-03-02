import 'package:accounts_protector/core/routing/app_router.dart';
import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:accounts_protector/features/platforms/ui/widgets/add_platform_view_widgets/add_platform_view_body.dart';
import 'package:flutter/material.dart';

class AddPlatformView extends StatelessWidget {
  const AddPlatformView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            AppRouter.router.pop();
          },
        ),
      ),
      body: AddPlatformViewBody(),
    );
  }
}
