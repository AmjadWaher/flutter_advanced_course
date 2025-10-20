// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText = false,
    this.suffixIcon,
    this.backgroundColor,
    this.keyboardType,
    this.controller,
    required this.validator,
  });
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Function(String? value) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscureText,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 17.h,
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: AppColors.mainBlue,
                width: 1.3,
              ),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: AppColors.snowGray,
                width: 1.5,
              ),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        hintStyle: hintStyle ?? TextStyles.font14SilverGrayMedium,
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: backgroundColor ?? AppColors.paleGray,
        filled: true,
      ),
      keyboardType: keyboardType,
      style: inputTextStyle ?? TextStyles.font14DarkBlueMedium,
      validator: (value) => validator(value),
    );
  }
}
