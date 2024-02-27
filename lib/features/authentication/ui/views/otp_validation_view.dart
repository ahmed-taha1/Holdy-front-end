import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/otp_validation_widgets/otp_validation_body.dart';

class OtpValidationView extends StatelessWidget {
  const OtpValidationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // scrolledUnderElevation: 5,
        toolbarHeight: 40.h,
      ),
      body: const OtpValidationViewBody(),
    );
  }
}
