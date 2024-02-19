import 'package:accounts_protector/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            context.push(AppRouter.kLoginView);
          },
          child: const Text('Go to login'),
        ),
      ),
    );
  }
}
