import 'package:accounts_protector/features/authentication/ui/views/login_view.dart';
import 'package:accounts_protector/features/authentication/ui/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/authentication/ui/views/forgot_password_view.dart';
import '../../features/home/ui/views/home_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kLoginView = '/loginView';
  static const kForgotPasswordView = '/forgotPasswordView';
  static const kRegisterView = '/registerView';

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
    ],
    initialLocation: kLoginView,
  );
}
