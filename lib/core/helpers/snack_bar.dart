import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SnackBar snackBar({
  String? title,
  required String content,
  IconData? icon,
  EdgeInsetsGeometry? margin,
  EdgeInsetsGeometry? padding,
  Color? backgroundColor,
}) {
  return SnackBar(
    duration: const Duration(seconds: 4),
    margin: margin,
    padding: padding,
    content: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: backgroundColor ?? AppColors.mainBlue,
      ),
      child: Row(
        children: [
          Icon(icon ?? Icons.info_outline, color: Colors.white, size: 30),
          horizontalSpace(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Text(title, style: TextStyles.font17WhiteSemiBold),
                verticalSpace(4),
                if (title != null)
                  Text(
                    content,
                    style: TextStyles.font14WhiteRegular.copyWith(height: 1.3),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
              ],
            ),
          ),
        ],
      ),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
