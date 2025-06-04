import 'package:completed_flutter_projects/core/routing/app_router.dart';
import 'package:completed_flutter_projects/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(List<String> args) {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Change to any color
      statusBarIconBrightness: Brightness.dark, // White icons
    ),
  );
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
