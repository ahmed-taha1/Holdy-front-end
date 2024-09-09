import 'package:accounts_protector/core/widgets/spacing.dart';
import 'package:accounts_protector/core/theming/text_styles.dart';
import 'package:accounts_protector/features/platform/logic/platform_crud_cubit.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlatformColorPicker extends StatefulWidget {
  final void Function(Color) onColorChanged;

  const PlatformColorPicker({super.key, required this.onColorChanged});

  @override
  State<PlatformColorPicker> createState() => _PlatformColorPickerState();
}

class _PlatformColorPickerState extends State<PlatformColorPicker> {
  late Color color;
  @override
  Widget build(BuildContext context) {
    color = context.read<PlatformCrudCubit>().selectedColor;
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              await _openColorPicker(context, widget.onColorChanged);
            },
            child: Container(
              decoration: BoxDecoration(
                color: color,
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
            style: TextStyles.font15BlackPurpleMedium.copyWith(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openColorPicker(
      BuildContext context, void Function(Color) onChanged) async {
    await ColorPicker(
      color: color,
      onColorChanged: (newColor) {
        onChanged(newColor);
        setState(() {
          color = newColor;
        });
      },
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.accent: false,
      },
      actionButtons: const ColorPickerActionButtons(
        closeButton: true,
        dialogActionButtons: false,
      ),
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
