import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'accounts_protector_app.dart';
import 'core/di/get_it.dart';
import 'core/services/cache_service.dart';
import 'core/routing/app_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  // to fix .sp font bug in flutter screentil in release mode
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  // Bloc.observer = MyBlocObserver();
  await CacheService.init();
  await ScreenUtil.ensureScreenSize();
  await AppRouter.setInitialRoute();
  setupGetIt();
  runApp(const AccountsProtectorApp());
}
