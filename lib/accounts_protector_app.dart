import 'package:accounts_protector/core/routing/app_router.dart';
import 'package:accounts_protector/core/theming/theme_bloc.dart';
import 'package:accounts_protector/features/accounts/logic/accounts_cubit.dart';
import 'package:accounts_protector/features/authentication/logic/forgot_password/forgot_password_cubit.dart';
import 'package:accounts_protector/features/authentication/logic/login/login_cubit.dart';
import 'package:accounts_protector/features/authentication/logic/register/register_cubit.dart';
import 'package:accounts_protector/features/pin/logic/create_pin_cubit.dart';
import 'package:accounts_protector/features/pin/logic/pin_cubit.dart';
import 'package:accounts_protector/features/platforms/logic/platforms/platforms_cubit.dart';
import 'package:accounts_protector/features/settings/logic/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          BlocProvider(create: (context) => ThemeBloc()..add(GetCurrentThemeEvent())),
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => CreatePinCubit()),
          BlocProvider(create: (context) => RegisterCubit()),
          BlocProvider(create: (context) => PinCubit()),
          BlocProvider(create: (context) => ForgotPasswordCubit()),
          BlocProvider(create: (context) => PlatformsCubit()),
          BlocProvider(create: (context) => SettingsCubit()),
          BlocProvider(create: (context) => AccountsCubit()),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            if(state is LoadedThemeState){
              return MaterialApp.router(
                builder: EasyLoading.init(),
                routerConfig: AppRouter.router,
                debugShowCheckedModeBanner: false,
                title: 'Accounts Protector',
                theme: state.theme,
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
