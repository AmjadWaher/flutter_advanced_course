import 'package:completed_flutter_projects/core/routing/app_router.dart';
import 'package:completed_flutter_projects/core/routing/routes.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatelessWidget {
  const DocApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (ctx, child) => MaterialApp(
            title: 'Doc App',
            theme: ThemeData(
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
            ),
            onGenerateRoute: appRouter.generateRoute,
            initialRoute: Routes.onBordingScreen,
            debugShowCheckedModeBanner: false,
          ),
    );
  }
}
