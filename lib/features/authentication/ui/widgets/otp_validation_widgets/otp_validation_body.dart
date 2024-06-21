import 'package:accounts_protector/core/widgets/spacing.dart';
import 'package:accounts_protector/core/widgets/custom_button.dart';
import 'package:accounts_protector/core/widgets/custom_input_text_field.dart';
import 'package:accounts_protector/core/widgets/view_header.dart';
import 'package:accounts_protector/features/authentication/logic/forgot_password/forgot_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/text_styles.dart';
import '../../../../../core/widgets/custom_text_button.dart';

class OtpValidationViewBody extends StatelessWidget {
  const OtpValidationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();

    return SafeArea(
      child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state is OtpValidationSuccess) {
            EasyLoading.dismiss();
            context.push(Routes.resetPasswordView.path);
          }
          if(state is ResendSendEmailSuccess){
            EasyLoading.dismiss();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text('OTP sent successfully'),
              ),
            );
          }
        },
        builder: (context, state) {
          return SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: const AlwaysScrollableScrollPhysics(),
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
                      controller: otpController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  verticalSpace(18),
                  CustomButton(
                    text: 'Proceed',
                    onPressed: () {
                      context.read<ForgotPasswordCubit>().verifyOtp(otp: otpController.text);
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
          );
        },
      ),
    );
  }
}
