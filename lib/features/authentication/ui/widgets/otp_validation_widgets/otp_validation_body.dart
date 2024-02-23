import 'package:accounts_protector/core/helper/spacing.dart';
import 'package:accounts_protector/core/routing/app_router.dart';
import 'package:accounts_protector/core/widgets/custom_button.dart';
import 'package:accounts_protector/core/widgets/custom_input_text_field.dart';
import 'package:accounts_protector/core/widgets/default_auth_text.dart';
import 'package:accounts_protector/features/authentication/ui/views/reset_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/custom_text_button.dart';

class OtpValidationViewBody extends StatelessWidget {
  const OtpValidationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // scrolledUnderElevation: 5,
        toolbarHeight: 40.h,
      ),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(50),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 42.w),
                  child: const DefaultAuthText(
                    mainText: 'OTP Validation',
                    subText: 'Please enter the OTP',
                    iconPath: 'assets/svgs/verify_otp_icon.svg',
                  ),
                ),
                verticalSpace(30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: CustomInputField(
                    icon: Icons.key,
                    hintText: 'OTP',
                    controller: otpController,
                    keyboardType: TextInputType.number,
                  ),
                ),
                verticalSpace(18),
                CustomButton(text: 'Proceed', onPressed: () {
                  context.push(AppRouter.kResetPasswordView);
                }),
                verticalSpace(14),
                CustomTextButton(
                  text: 'Resend OTP',
                  textStyle: TextStyles.font14SemiLightBlueBold,
                  onPressed: () {
                    // context.push();
                  },
                ),
                verticalSpace(130.h),
                Text(
                  'Note: the OTP is valid for 5 minutes only.',
                  style: TextStyles.font15DarkGreySemiBold,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
