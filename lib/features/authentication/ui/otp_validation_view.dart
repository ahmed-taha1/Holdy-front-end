import 'package:accounts_protector/core/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_app_bar_with_back.dart';
import 'package:accounts_protector/core/widgets/spacing.dart';
import 'package:accounts_protector/core/widgets/custom_button.dart';
import 'package:accounts_protector/core/widgets/custom_input_text_field.dart';
import 'package:accounts_protector/core/widgets/view_header.dart';
import 'package:accounts_protector/features/authentication/logic/forgot_password/forgot_password_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/text_styles.dart';
import '../../../../../core/widgets/custom_text_button.dart';

class OtpValidationView extends StatelessWidget {
  const OtpValidationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBack(
        isScrolled: true,
        backGroundColor: Theme.of(context).scaffoldBackgroundColor,
        arrowColor: Theme.of(context).primaryColor,
      ),

      body: SafeArea(
        child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
          listener: (context, state) {
            if (state is OtpValidationSuccess) {
              EasyLoading.dismiss();
              context.push(Routes.resetPasswordView.path, extra: context.read<ForgotPasswordCubit>());
            }
            if (state is ResendSendEmailSuccess) {
              EasyLoading.dismiss();
              showSnackBar(context: context, message: 'OTP sent successfully', color: Colors.green);
            }
          },
          child: SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpace(50),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 42.w),
                    child: const ViewHeader(
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
                      controller:
                      context.read<ForgotPasswordCubit>().otpController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  verticalSpace(18),
                  CustomButton(
                    text: 'Proceed',
                    onPressed: () {
                      context.read<ForgotPasswordCubit>().verifyOtp();
                    },
                  ),
                  verticalSpace(14),
                  CustomTextButton(
                    text: 'Resend OTP',
                    textStyle: TextStyles.font14SemiLightBlueBold,
                    onPressed: () {
                      context.read<ForgotPasswordCubit>().resendEmail();
                    },
                  ),
                  verticalSpace(100),
                  Text(
                    'Note: the OTP is valid for 5 minutes only.',
                    style: TextStyles.font15DarkGreySemiBold.copyWith(
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
