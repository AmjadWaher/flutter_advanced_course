import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:completed_flutter_projects/core/themes/app_colors.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.buttonText,
    this.horizontalPadding,
    this.verticalPadding,
    this.backgroundColor,
    required this.textStyle,
    this.borderRadius,
    this.buttonWidth,
    this.buttonHeight,
    required this.onPressed,
  });
  final String buttonText;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Color? backgroundColor;
  final TextStyle textStyle;
  final double? borderRadius;
  final double? buttonWidth;
  final double? buttonHeight;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 12.w,
              vertical: verticalPadding ?? 14.h),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
          backgroundColor ?? AppColors.mainBlue,
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
          ),
        ),
        fixedSize: WidgetStateProperty.all<Size>(
          Size(buttonWidth ?? double.maxFinite, buttonHeight ?? 50.h),
        ),
      ),
      child: Text(buttonText, style: textStyle),
    );
  }
}
