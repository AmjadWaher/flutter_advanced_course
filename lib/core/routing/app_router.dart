import 'package:completed_flutter_projects/core/di/dependence_injection.dart';
import 'package:completed_flutter_projects/core/routing/routes.dart';
import 'package:completed_flutter_projects/features/auth/logic/cubit/login_cubit.dart';
import 'package:completed_flutter_projects/features/auth/ui/screens/login_screen.dart';
import 'package:completed_flutter_projects/features/home/ui/home_screen.dart';
import 'package:completed_flutter_projects/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings setting) {
    // This arguments to be passed in any screen like this (arguments as ClassName)
    final arguments = setting.arguments;

    switch (setting.name) {
      case Routes.onBordingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const HomeScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${setting.name}')),
          ),
        );
    }
  }
}
