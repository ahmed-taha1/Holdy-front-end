import 'package:accounts_protector/features/authentication/ui/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              'Login',
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              'Please Sign in first',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w100),
            ),
            const CustomInputField(),
          ],
        ),
      ),
    );
  }
}


