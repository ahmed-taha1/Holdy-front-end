import 'package:accounts_protector/core/helper/bloc_observer.dart';
import 'package:accounts_protector/core/networking/web_services/api_service.dart';
import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'accounts_protector_app.dart';
import 'core/networking/urls.dart';

void main() async {
  // setupGetIT();
  // to fix .sp font bug in flutter screentil in release mode
  Bloc.observer = MyBlocObserver();
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: AppColors.purple,
  //   statusBarIconBrightness: Brightness.light,
  // ));
  await ScreenUtil.ensureScreenSize();
  runApp(const AccountsProtectorApp());
}