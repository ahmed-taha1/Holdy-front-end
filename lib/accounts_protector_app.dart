import 'package:accounts_protector/core/networking/logic/connection_handler_bloc.dart';
import 'package:accounts_protector/core/routing/app_router.dart';
import 'package:accounts_protector/core/theming/logic/theme_bloc.dart';
import 'package:accounts_protector/features/accounts/logic/accounts_cubit.dart';
import 'package:accounts_protector/features/authentication/logic/forgot_password/forgot_password_cubit.dart';
import 'package:accounts_protector/features/authentication/logic/login/login_cubit.dart';
import 'package:accounts_protector/features/authentication/logic/register/register_cubit.dart';
import 'package:accounts_protector/features/offline/offline_view.dart';
import 'package:accounts_protector/features/pin/logic/create_pin_cubit.dart';
import 'package:accounts_protector/features/pin/logic/pin_cubit.dart';
import 'package:accounts_protector/features/platforms/logic/platforms/platforms_cubit.dart';
import 'package:accounts_protector/features/settings/logic/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountsProtectorApp extends StatelessWidget {
  const AccountsProtectorApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    ScreenUtil.init(context);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => ThemeBloc()..add(GetCurrentThemeEvent())),
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => CreatePinCubit()),
          BlocProvider(create: (context) => RegisterCubit()),
          BlocProvider(create: (context) => PinCubit()),
          BlocProvider(create: (context) => ForgotPasswordCubit()),
          BlocProvider(create: (context) => PlatformsCubit()),
          BlocProvider(create: (context) => SettingsCubit()),
          BlocProvider(create: (context) => AccountsCubit()),
          BlocProvider(create: (context) => ConnectionHandlerBloc()),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themeState) {
            if (themeState is LoadedThemeState) {
              return BlocBuilder<ConnectionHandlerBloc, ConnectionHandlerState>(
                builder: (context, connectionState) {
                  if (connectionState is ConnectedState) {
                    return MaterialApp.router(
                      builder: EasyLoading.init(),
                      routerConfig: AppRouter.router,
                      debugShowCheckedModeBanner: false,
                      title: 'Accounts Protector',
                      theme: themeState.theme,
                    );
                  } else if (connectionState is NotConnectedState) {
                    return OfflineView(
                      appTheme: themeState.theme,
                    );
                  } else {
                    return Container();
                  }
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
