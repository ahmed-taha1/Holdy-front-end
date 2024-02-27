import 'package:accounts_protector/features/authentication/ui/widgets/Register_widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // scrolledUnderElevation: 5,
        toolbarHeight: 33.h,
      ),
      body: const RegisterViewBody(),
    );
  }
}
