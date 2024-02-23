import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/styles.dart';

// class WidgetsDrawer {
//
//   static Widget drawElevatedButton(
//       {required String text, required VoidCallback onPressed}) {
//     return Container(
//       height: 60,
//       width: 200,
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           elevation: 2,
//           shadowColor: AppColors.cyan,
//           backgroundColor: AppColors.cyan,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(100),
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8),
//           child: Text(
//             text,
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 25,
//               color: AppColors.cyan,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    Key? key,
    required this.icon,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    this.isPassword = false,
    this.suffixIcon,
  }) : super(key: key);

  final IconData icon;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final Widget? suffixIcon;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late FocusNode _focusNode;
  bool _isFocused = false;
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color:
                _isFocused ? Colors.black.withOpacity(0.1) : Colors.transparent,
            spreadRadius: 2,
            blurRadius: 7.4,
            offset: const Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(21),
      ),
      child: TextFormField(
        obscureText: widget.isPassword ? !_isPasswordVisible : false,
        controller: widget.controller,
        focusNode: _focusNode,
        keyboardType: widget.keyboardType,
        style: TextStyles.font17BlackPurpleBold,
        decoration: InputDecoration(
          prefixIcon: Icon(
            widget.icon,
            color: _isFocused ? AppColors.blackPurple : AppColors.lightGrey,
          ),
          labelText: widget.hintText,
          labelStyle: TextStyles.font11LightGreyBold,
          floatingLabelStyle: TextStyles.font15DarkGreySemiBold,
          filled: true,
          fillColor: _isFocused ? AppColors.lightCyan : Colors.transparent,
          border: const UnderlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(21),
            ),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.only(
            top: 15.h,
            left: 10.w,
            right: 10.w,
            bottom: 20.h,
          ),
          suffixIcon: widget.suffixIcon ??
              (widget.isPassword
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      child: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: _isFocused
                            ? AppColors.blackPurple
                            : AppColors.lightGrey,
                      ),
                    )
                  : null),
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }
}
