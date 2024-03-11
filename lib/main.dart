import 'package:accounts_protector/core/helper/bloc_observer.dart';
import 'package:accounts_protector/core/networking/web_services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'accounts_protector_app.dart';
import 'core/networking/urls.dart';

void main() async {
  // setupGetIT();
  // to fix .sp font bug in flutter screentil in release mode
  Bloc.observer= MyBlocObserver();
  await ScreenUtil.ensureScreenSize();
  runApp(const AccountsProtectorApp());
}