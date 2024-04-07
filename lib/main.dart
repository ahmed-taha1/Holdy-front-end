import 'package:accounts_protector/core/helper/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'accounts_protector_app.dart';
import 'core/di/get_it.dart';
import 'core/helper/cache_helper.dart';
import 'core/routing/app_router.dart';

void main() async {
  // to fix .sp font bug in flutter screentil in release mode
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  await ScreenUtil.ensureScreenSize();
  AppRouter.setInitialRoute();
  setupGetIt();
  runApp(const AccountsProtectorApp());
}