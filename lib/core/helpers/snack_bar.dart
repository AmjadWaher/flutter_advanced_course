import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SnackBar snackBar({
  required String title,
  required String content,
  IconData? icon,
  Color? backgroundColor,
}) {
  return SnackBar(
    duration: Duration(seconds: 4),
    content: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: backgroundColor ?? AppColors.mainBlue,
      ),
      child: Row(
        children: [
          Icon(
            icon ?? Icons.info_outline,
            color: Colors.white,
            size: 30,
          ),
          horizontalSpace(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.font17WhiteSemiBold,
                ),
                verticalSpace(4),
                Text(
                  content,
                  style: TextStyles.font14WhiteRegular.copyWith(
                    height: 1.3,
                  ),
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
