import 'package:completed_flutter_projects/core/di/dependence_injection.dart';
import 'package:completed_flutter_projects/core/routing/routes.dart';
import 'package:completed_flutter_projects/features/home/data/models/specialty_response.dart';

import 'package:completed_flutter_projects/features/login/logic/cubit/login_cubit.dart';
import 'package:completed_flutter_projects/features/login/ui/screens/login_screen.dart';

import 'package:completed_flutter_projects/features/onboarding/onboarding_screen.dart';
import 'package:completed_flutter_projects/features/signup/logic/cubit/sign_up_cubit.dart';
import 'package:completed_flutter_projects/features/signup/ui/screens/sign_up_screen.dart';

import 'package:completed_flutter_projects/features/doctor_speciality/doctor_specialty_screen.dart';
import 'package:completed_flutter_projects/main_home/main_home_screen.dart';
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
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpScreen(),
          ),
        );
      case Routes.mainHomeScreen:
        return MaterialPageRoute(
          builder: (_) => const MainHomeScreen(),
        );
      case Routes.doctorSpecialtyScreen:
        return MaterialPageRoute(
          builder: (_) => DoctorSpecialtyScreen(
            specialtyList: arguments as List<Specialty>,
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
