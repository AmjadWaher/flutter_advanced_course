import 'package:completed_flutter_projects/core/helpers/constants.dart';
import 'package:completed_flutter_projects/core/routing/app_router.dart';
import 'package:completed_flutter_projects/core/routing/routes.dart';
import 'package:completed_flutter_projects/core/themes/app_theme.dart';
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
            theme: appTheme(),
            onGenerateRoute: appRouter.generateRoute,
            initialRoute:
                isLoggedInUser ? Routes.mainHomeScreen : Routes.onBordingScreen,
            debugShowCheckedModeBanner: false,
          ),
    );
  }
}
