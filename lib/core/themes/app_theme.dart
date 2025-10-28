import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:flutter/material.dart';

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
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
    )
  );
}
