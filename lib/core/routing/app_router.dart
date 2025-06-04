import 'package:completed_flutter_projects/core/routing/routes.dart';
import 'package:completed_flutter_projects/features/auth/ui/screens/login_screen.dart';
import 'package:completed_flutter_projects/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings setting){
    // This arguments to be passed in any screen like this (arguments as ClassName)
    final arguments = setting.arguments;

    switch (setting.name) {
      case Routes.onBordingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) =>  Scaffold(
            body: Center(child: Text('No route defined for ${setting.name}')),
          ),
        );
    }
  }
}