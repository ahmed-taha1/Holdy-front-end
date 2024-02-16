import 'package:accounts_protector/core/theming/colors.dart';
import 'package:accounts_protector/core/utils/app_router.dart';
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
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.darkViolet,
          textTheme:ThemeData.dark().textTheme
        ),
      ),
    );
  }
}