import 'package:flutter/material.dart';

class TextControllerAttribute{
  TextEditingController key;
  TextEditingController value;
  bool isSensitive;

  TextControllerAttribute({
    TextEditingController? key,
    TextEditingController? value,
    bool? isSensitive,
  }) : key = key ?? TextEditingController(),
        value = value ?? TextEditingController(),
        isSensitive = isSensitive ?? false;
}