import 'package:accounts_protector/core/helper/bloc_observer.dart';
import 'package:accounts_protector/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'accounts_protector_app.dart';
import 'core/helper/cache_helper.dart';

void main() async {
  // setupGetIT();
  // to fix .sp font bug in flutter screentil in release mode
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: AppColors.purple,
  //   statusBarIconBrightness: Brightness.light,
  // ));
  await CacheHelper.init();
  await ScreenUtil.ensureScreenSize();
  AppRouter.setInitialRoute();
  runApp(const AccountsProtectorApp());
}