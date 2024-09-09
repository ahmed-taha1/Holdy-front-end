import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/text_styles.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    Key? key,
    this.icon,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    this.isPassword = false,
    this.suffixIcon,
    this.validationFunction,
    this.onChange,
  }) : super(key: key);

  final IconData? icon;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final Widget? suffixIcon;
  final String? Function(String?)? validationFunction;
  final Function(String)? onChange;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21.r),
      ),
      child: TextFormField(
        onChanged: widget.onChange,
        obscureText: widget.isPassword ? !_isPasswordVisible : false,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        style: TextStyles.font17BlackPurpleBold.copyWith(
            color: Theme.of(context).primaryColor,
        ),
        decoration: InputDecoration(
          prefixIcon: widget.icon != null ? Icon(
            widget.icon,
            color: Theme.of(context).primaryColor/* : Theme.of(context).hintColor*/,
          ) : null,
          labelText: widget.hintText,
          labelStyle: TextStyles.font11LightGreyBold.copyWith(
              color: Theme.of(context).hintColor,
          ),
          floatingLabelStyle: TextStyles.font15DarkGreySemiBold.copyWith(
            color: Theme.of(context).secondaryHeaderColor,
          ),
          filled: true,
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(21.r),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(21.r),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          errorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(21.r),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(21.r),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          contentPadding: EdgeInsets.only(
            top: 15.h,
            left: 10.w,
            right: 10.w,
            bottom: 20.h,
          ),
          errorStyle: TextStyles.font12RedBold,
          suffixIcon: widget.suffixIcon ??
              (widget.isPassword
                  ? GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            _isPasswordVisible = !_isPasswordVisible;
                          },
                        );
                      },
                      child: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: /*_isFocused*/
                            Theme.of(context).primaryColor
                            // : Theme.of(context).hintColor,
                      ),
                    )
                  : null),
        ),
        validator: widget.validationFunction,
      ),
    );
  }
}
