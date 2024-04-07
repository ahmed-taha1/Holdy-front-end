import 'package:accounts_protector/core/helper/spacing.dart';
import 'package:accounts_protector/core/theming/styles.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../logic/platforms/platforms_cubit.dart';

class PlatformColorPicker extends StatefulWidget {
  const PlatformColorPicker({super.key, this.initialColor});
  final Color? initialColor;
  @override
  State<PlatformColorPicker> createState() => _PlatformColorPickerState();
}

class _PlatformColorPickerState extends State<PlatformColorPicker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: _openColorPicker,
            child: Container(
              decoration: BoxDecoration(
                color: context.read<PlatformsCubit>().selectedColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.r),
                ),
              ),
              width: 35.w,
              height: 35.h,
            ),
          ),
          horizontalSpace(10),
          Text(
            "Icon Color",
            style: TextStyles.font15BlackPurpleMedium,
          ),
        ],
      ),
    );
  }

  Future<void> _openColorPicker() async {
    /*bool pickedColor = */await ColorPicker(
      color: context.read<PlatformsCubit>().selectedColor,
      onColorChanged: (Color newColor) {
        setState(() {
          context.read<PlatformsCubit>().selectedColor = newColor;
        });
      },
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.accent: false,
      },
      width: 40.w,
      height: 40.h,
      borderRadius: 20.r,
      spacing: 10,
      runSpacing: 10,
      heading: const Text('Pick a color'),
      subheading: const Text('Select a color for your platform'),
      wheelDiameter: 200,
      wheelWidth: 20,
    ).showPickerDialog(context);
  }
}
