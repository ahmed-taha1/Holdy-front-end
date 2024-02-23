import 'package:accounts_protector/features/authentication/ui/views/login_view.dart';
import 'package:accounts_protector/features/authentication/ui/views/otp_validation_view.dart';
import 'package:accounts_protector/features/authentication/ui/views/register_view.dart';
import 'package:accounts_protector/features/authentication/ui/views/reset_password_view.dart';
import 'package:go_router/go_router.dart';
import '../../features/authentication/ui/views/forgot_password_view.dart';
import '../../features/home/ui/views/home_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kLoginView = '/loginView';
  static const kForgotPasswordView = '/forgotPasswordView';
  static const kRegisterView = '/registerView';
  static const kOtpValidationView = '/otpValidationView';
  static const kResetPasswordView = '/ResetPasswordView';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(path: kLoginView, builder: (context, state) => const LoginView()),
      GoRoute(
        path: kForgotPasswordView,
        builder: (context, state) => const ForgotPasswordView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(path: kOtpValidationView, builder: (context, state) => const OtpValidationView()),
      GoRoute(path: kResetPasswordView, builder: (context, state) => const ResetPasswordView()),
    ],
    initialLocation: kLoginView,
  );
}
