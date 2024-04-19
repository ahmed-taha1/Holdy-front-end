import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void showCustomLoading(){
  EasyLoading.show(
    status: 'Loading...',
    dismissOnTap: false,
    maskType: EasyLoadingMaskType.black,
    indicator: const CircularProgressIndicator(
      strokeCap: StrokeCap.round,
    ),
  );
}