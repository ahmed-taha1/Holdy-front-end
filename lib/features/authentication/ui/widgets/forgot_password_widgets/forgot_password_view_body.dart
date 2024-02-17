import 'package:accounts_protector/core/helper/spacing.dart';
import 'package:accounts_protector/core/widgets/custom_button.dart';
import 'package:accounts_protector/core/widgets/custom_input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'icon_wtith_top_text.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 5,
        toolbarHeight: 40.h,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(50),
              const IconWithTopText(),
              verticalSpace(30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.w),
                child: CustomInputField(
                  icon: Icons.email_outlined,
                  hintText: 'EMAIL',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              verticalSpace(18),
              CustomButton(text: 'Send', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}