import 'package:accounts_protector/core/services/cache_service.dart';
import 'package:accounts_protector/core/routing/routes.dart';
import 'package:accounts_protector/features/account/logic/account_crud_cubit.dart';
import 'package:accounts_protector/features/account/logic/account_cubit.dart';
import 'package:accounts_protector/features/authentication/logic/forgot_password/forgot_password_cubit.dart';
import 'package:accounts_protector/features/authentication/logic/register/register_cubit.dart';
import 'package:accounts_protector/features/authentication/ui/login_view.dart';
import 'package:accounts_protector/features/help/help_view.dart';
import 'package:accounts_protector/features/home/logic/home_cubit.dart';
import 'package:accounts_protector/features/home/ui/home_view.dart';
import 'package:accounts_protector/features/pin/ui/pin_view.dart';
import 'package:accounts_protector/features/platform/logic/platform_cubit.dart';
import 'package:accounts_protector/features/settings/logic/settings_cubit.dart';
import 'package:accounts_protector/features/settings/ui/settings_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/account/ui/account_view.dart';
import '../../features/account/ui/create_account_view.dart';
import '../../features/account/ui/update_account_view.dart';
import '../../features/authentication/logic/login/login_cubit.dart';
import '../../features/authentication/ui/forgot_password_view.dart';
import '../../features/authentication/ui/otp_validation_view.dart';
import '../../features/authentication/ui/register_view.dart';
import '../../features/authentication/ui/reset_password_view.dart';
import '../../features/pin/logic/create_pin_cubit.dart';
import '../../features/pin/logic/pin_cubit.dart';
import '../../features/pin/ui/create_pin_view.dart';
import '../../features/platform/logic/platform_crud_cubit.dart';
import '../../features/platform/ui/create_platform_view.dart';
import '../../features/platform/ui/platform_view.dart';
import '../../features/platform/ui/update_platform_view.dart';
import '../di/get_it.dart';
import '../models/account.dart';
import '../models/platform.dart';

abstract class AppRouter {
  static String? currentLocation;
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: Routes.loginView.path,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: Routes.forgotPasswordView.path,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<ForgotPasswordCubit>(),
          child: const ForgotPasswordView(),
        ),
      ),
      GoRoute(
        path: Routes.registerView.path,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<RegisterCubit>(),
          child: const RegisterView(),
        ),
      ),
      GoRoute(
        path: Routes.otpValidationView.path,
        builder: (context, state) => BlocProvider.value(
          value: state.extra as ForgotPasswordCubit,
          child: const OtpValidationView(),
        ),
      ),
      GoRoute(
        path: Routes.resetPasswordView.path,
        builder: (context, state) => BlocProvider.value(
          value: state.extra as ForgotPasswordCubit,
          child: const ResetPasswordView(),
        ),
      ),
      GoRoute(
        path: Routes.platformView.path,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              getIt<PlatformCubit>()..setPlatform(state.extra as Platform),
          child: const PlatformView(),
        ),
      ),
      GoRoute(
        path: Routes.createPlatformView.path,
        builder: (context, state) => BlocProvider(
            create: (context) => getIt<PlatformCrudCubit>(),
            child: const CreatePlatformView()),
      ),
      GoRoute(
        path: Routes.createPinView.path,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<CreatePinCubit>(),
          child: const CreatePinView(),
        ),
      ),
      GoRoute(
        path: Routes.homeView.path,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<HomeCubit>()..fetchUserData(),
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: Routes.pinView.path,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt<PinCubit>(),
            child: PinView(
              onSuccess: state.extra as VoidCallback,
            ),
          );
        },
      ),
      GoRoute(
        path: Routes.settingsView.path,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<SettingsCubit>()..initialize(),
          child: const SettingsView(),
        ),
      ),
      GoRoute(
        path: Routes.createAccountView.path,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<AccountCrudCubit>()..setPlatformId(state.extra as int),
          child: const CreateAccountView(),
        ),
      ),
      GoRoute(
        path: Routes.accountView.path,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              getIt<AccountCubit>()..setAccount(state.extra as Account),
          child: const AccountView(),
        ),
      ),
      GoRoute(
        path: Routes.updateAccountView.path,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<AccountCrudCubit>()
            ..setAccount(state.extra as Account)
            ..fillControllers(),
          child: const UpdateAccountView(),
        ),
      ),
      GoRoute(
        path: Routes.updatePlatformView.path,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              getIt<PlatformCrudCubit>()..setPlatform(state.extra as Platform),
          child: const UpdatePlatformView(),
        ),
      ),
      GoRoute(
        path: Routes.helpView.path,
        builder: (context, state) => const HelpView(),
      ),
    ],
    initialLocation: Routes.loginView.path,
  );

  static Future<void> setInitialRoute() async{
    if (await CacheService.getData(key: CacheServiceConstants.isLogged) == true) {
      router.go(
        Routes.pinView.path,
        extra: () {
          router.pushReplacement(Routes.homeView.path);
        },
      );
    }
  }
}
