import 'package:accounts_protector/core/routing/routes.dart';
import 'package:accounts_protector/features/authentication/ui/views/login_view.dart';
import 'package:accounts_protector/features/authentication/ui/views/otp_validation_view.dart';
import 'package:accounts_protector/features/authentication/ui/views/register_view.dart';
import 'package:accounts_protector/features/authentication/ui/views/reset_password_view.dart';
import 'package:accounts_protector/features/platforms/ui/views/platforms_view.dart';
import 'package:go_router/go_router.dart';
import '../../features/authentication/ui/views/forgot_password_view.dart';
import '../../features/pin/ui/pin_view.dart';

abstract class AppRouter {
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
          path: Routes.pinView.path,
          builder: (context, state) => const PinView()),
    ],
    initialLocation: Routes.loginView.path,
    // initialLocation: Routes.pinView.path,
  );
}