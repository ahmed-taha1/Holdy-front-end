import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'accounts_protector_app.dart';

void main() async {
  // setupGetIT();
  // to fix .sp font bug in flutter screentil in release mode
  await ScreenUtil.ensureScreenSize();
  runApp(const AccountsProtectorApp());
}