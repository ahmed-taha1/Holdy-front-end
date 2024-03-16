import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:accounts_protector/core/routing/app_router.dart';
import 'package:accounts_protector/features/authentication/logic/login_cubit.dart';
import 'package:accounts_protector/features/authentication/logic/register/register_cubit.dart';
import 'package:accounts_protector/features/pin/logic/pin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helper/font_weight_helper.dart';

class AccountsProtectorApp extends StatelessWidget {
  const AccountsProtectorApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => PinCubit()),
          BlocProvider(create: (context) => RegisterCubit()),
        ],
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          title: 'Accounts Protector',
          theme: ThemeData(
            fontFamily: FontWeightHelper.regular,
            // scaffoldBackgroundColor: AppColors.white,
            primaryColor: AppColors.blackPurple,
            primarySwatch: Colors.grey,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
            textTheme: ThemeData.light().textTheme,
          ),
        ),
      ),
    );
  }
}
