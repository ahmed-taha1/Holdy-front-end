import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:accounts_protector/features/authentication/ui/widgets/Register_widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_app_app_bar_with_back.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.h),
          child: const CustomAppBarWithBack()),
      body: const RegisterViewBody(),
    );
  }
}
