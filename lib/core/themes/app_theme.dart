import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.mainBlue,
    scaffoldBackgroundColor: Colors.white,
    tabBarTheme: TabBarThemeData(
      dividerColor: AppColors.snowGray,
      labelColor: AppColors.mainBlue,
      unselectedLabelColor: AppColors.neutralGray,
      labelStyle: TextStyles.font14GrayBold,
      indicatorColor: AppColors.mainBlue,
      indicatorSize: TabBarIndicatorSize.tab,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
    ),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.mainBlue, width: 2),
      ),
      prefixIconConstraints: BoxConstraints(
        maxHeight: 40.h,
        maxWidth: 40.w,
        minHeight: 30.h,
        minWidth: 30.w,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.coralRed, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.mainBlue, width: 2),
      ),
    ),
  );
}
