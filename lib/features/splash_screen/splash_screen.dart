import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
        child: Center(
          // child: Lottie.network('https://lottie.host/673091cf-4ccd-417d-9143-b2e6538f4ab8/8N9jQuc8Cz.json'),
          child: Lottie.asset(
            'assets/lottie/man.json',
            frameRate: FrameRate.max,
            height: 300,
          ),
        ),
      ),
    );
  }
}
