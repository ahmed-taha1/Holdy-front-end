import 'package:accounts_protector/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/theming/text_styles.dart';

class OfflineView extends StatelessWidget {
  const OfflineView({super.key, required this.appTheme});
  final ThemeData appTheme;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(
          backGroundColor: appTheme.scaffoldBackgroundColor,
        ),
        backgroundColor: appTheme.scaffoldBackgroundColor,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/svgs/offline.svg",
                height: 218.h, width: 218.w),
            Text(
              "You Are Offline",
              style: TextStyles.font30BlackPurpleBold.copyWith(
                color: appTheme.primaryColor,
              ),
            ),
            Text(
              "please reconnect to be able to use\nthe application",
              textAlign: TextAlign.center,
              style: TextStyles.font15DarkGreySemiBold.copyWith(
                color: appTheme.secondaryHeaderColor,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
