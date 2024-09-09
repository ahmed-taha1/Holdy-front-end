import 'package:accounts_protector/core/routing/app_router.dart';
import 'package:accounts_protector/core/theming/logic/theme_bloc.dart';
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
      child: BlocProvider(
        create: (context) => ThemeBloc()
          ..add(
            GetCurrentThemeEvent(),
          ),
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themeState) {
            if (themeState is LoadedThemeState) {
              return MaterialApp.router(
                builder: EasyLoading.init(),
                routerConfig: AppRouter.router,
                debugShowCheckedModeBanner: false,
                title: 'Holdy',
                theme: themeState.theme,
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
