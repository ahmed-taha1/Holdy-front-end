import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:accounts_protector/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AccountsProtectorApp extends StatelessWidget {

    const AccountsProtectorApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp.router(
        routerConfig: AppRouter.router,

        debugShowCheckedModeBanner: false,
        title: 'Accounts Protector',
        theme: ThemeData(
          fontFamily: 'KinesisPro',
          scaffoldBackgroundColor: AppColors.white,
          primaryColor: AppColors.navyBlue,
          textTheme:ThemeData.light().textTheme,
        ),
      ),
    );
  }
}