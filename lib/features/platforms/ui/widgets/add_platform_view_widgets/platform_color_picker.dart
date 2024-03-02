import 'package:accounts_protector/core/helper/spacing.dart';
import 'package:accounts_protector/core/theming/styles.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

class PlatformColorPicker extends StatefulWidget {
  const PlatformColorPicker({super.key});

  @override
  State<PlatformColorPicker> createState() => _PlatformColorPickerState();
}

class _PlatformColorPickerState extends State<PlatformColorPicker> {
  Color selectedColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          GestureDetector(
            onTap: _openColorPicker,
            child: Container(
              decoration: BoxDecoration(
                  color: selectedColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              width: 40,
              height: 40,
            ),
          ),
          horizontalSpace(10),
          Text(
            "Icon Color",
            style: TextStyles.font15BlackPurpleMedium,
          ),
        ]));
  }

  Future<void> _openColorPicker() async {
    bool pickedColor = await ColorPicker(
      color: selectedColor,
      onColorChanged: (Color newColor) {
        setState(() {
          selectedColor = newColor;
        });
      },
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.accent: false,
      },
      width: 40,
      height: 40,
      borderRadius: 20,
      spacing: 10,
      runSpacing: 10,
      heading: const Text('Pick a color'),
      subheading: const Text('Select a color for your platform'),
      wheelDiameter: 200,
      wheelWidth: 20,
    ).showPickerDialog(context);
  }
}
