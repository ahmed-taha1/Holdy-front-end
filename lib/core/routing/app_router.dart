import 'package:accounts_protector/core/helper/cache_helper.dart';
import 'package:accounts_protector/core/routing/routes.dart';
import 'package:accounts_protector/features/authentication/ui/views/login_view.dart';
import 'package:accounts_protector/features/authentication/ui/views/otp_validation_view.dart';
import 'package:accounts_protector/features/authentication/ui/views/register_view.dart';
import 'package:accounts_protector/features/authentication/ui/views/reset_password_view.dart';
import 'package:accounts_protector/features/pin/ui/views/pin_view.dart';
import 'package:accounts_protector/features/platforms/ui/views/add_platform_view.dart';
import 'package:accounts_protector/features/platforms/ui/views/platforms_view.dart';
import 'package:accounts_protector/features/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/authentication/ui/views/forgot_password_view.dart';
import '../../features/pin/ui/views/create_pin_view.dart';

abstract class AppRouter {
  static String? currentLocation;
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
          path: Routes.loginView.path,
          builder: (context, state) => const LoginView()),
      GoRoute(
        path: Routes.forgotPasswordView.path,
        builder: (context, state) => const ForgotPasswordView(),
      ),
      GoRoute(
        path: Routes.registerView.path,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
          path: Routes.otpValidationView.path,
          builder: (context, state) => const OtpValidationView()),
      GoRoute(
          path: Routes.resetPasswordView.path,
          builder: (context, state) => const ResetPasswordView()),
      GoRoute(
          path: Routes.platformsView.path,
          builder: (context, state) => const PlatformsView()),
      GoRoute(
          path: Routes.addPlatformView.path,
          builder: (context, state) => const AddPlatformView()),
      GoRoute(
          path: Routes.createPinView.path,
          builder: (context, state) => const CreatePinView()),
      GoRoute(
          path: Routes.pinView.path,
          builder: (context, state) => const PinView()),
      GoRoute(
          path: Routes.splashScreen.path,
          builder: (context, state) => const SplashScreen()),
    ],
    observers: [GlobalRouteObserver()],
    initialLocation: Routes.loginView.path,
    // initialLocation: Routes.splashScreen.path,
  );

  static void setInitialRoute() {
    if (CacheHelper.getData(key: CacheHelperConstants.isLogged) == true) {
      router.go(Routes.pinView.path);
    }
  }
}

// Global route observer to track route changes
class GlobalRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route is PageRoute && !route.isFirst) {
      // Update the current route name when a new route is pushed
      AppRouter.currentLocation = route.settings.name ?? '';
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (previousRoute is PageRoute) {
      // Update the current route name when a route is popped
      AppRouter.currentLocation = previousRoute.settings.name ?? '';
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (newRoute is PageRoute && !newRoute.isFirst) {
      // Update the current route name when a new route is pushed
      AppRouter.currentLocation = newRoute.settings.name ?? '';
    }
  }
}