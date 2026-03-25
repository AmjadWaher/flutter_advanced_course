import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void appDialog(
  BuildContext context, {
  int? height,
  int? width,
  required void Function() acceptButtonOnPressed,
  required void Function() rejectButtonOnPressed,
  required String title,
  required String content,
  String? acceptButtonText,
  String? rejectButtonText,
  TextStyle? acceptButtonTextStyle,
  TextStyle? rejectButtonTextStyle,
  Color? acceptButtonColor,
  Color? rejectButtonColor,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    builder: (_) {
      return Center(
        child: Container(
          height: (height ?? 190).h,
          width: (width ?? 250).w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(50),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
              BoxShadow(
                color: Colors.black.withAlpha(50),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: TextStyles.font18Black87Bold),
              verticalSpace(12),
              Text(
                content,
                style: TextStyles.font16Black54Regular,
                textAlign: TextAlign.center,
              ),
              verticalSpace(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: rejectButtonOnPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: rejectButtonColor ?? Colors.grey[300],
                    ),
                    child: Text(
                      rejectButtonText ?? 'No',
                      style:
                          rejectButtonTextStyle ??
                          TextStyles.font14BlackRegular,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: acceptButtonOnPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: acceptButtonColor ?? AppColors.mainBlue,
                    ),
                    child: Text(
                      acceptButtonText ?? 'Yes',
                      style:
                          acceptButtonTextStyle ??
                          TextStyles.font14WhiteRegular,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
