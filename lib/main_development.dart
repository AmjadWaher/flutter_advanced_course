import 'package:completed_flutter_projects/core/di/dependence_injection.dart';
import 'package:completed_flutter_projects/core/routing/app_router.dart';
import 'package:completed_flutter_projects/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(List<String> args) async {
  setUpGetIt();
  // to fix texts being hidden font bug in flutter_screenutil in release mode
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
