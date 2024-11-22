import 'package:first_haid/features/authentication/domain/auth_repository.dart';
import 'package:first_haid/features/authentication/presentation/pages/login_page.dart';
import 'package:first_haid/features/authentication/presentation/pages/setup_profile_page.dart';
import 'package:first_haid/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:first_haid/features/home/pages/bottom_nav_bar_page.dart';
import 'package:first_haid/features/home/pages/home.dart';
import 'package:first_haid/features/onboarding/onboarding_mainpage.dart';
import 'package:flutter/material.dart';

import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRoutes.setupprofile:
        return MaterialPageRoute(builder: (_) => const SetupProfilePage());
      case AppRoutes.signuppage:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case AppRoutes.authrepository:
        return MaterialPageRoute(builder: (_) => const AuthRepository());
      case AppRoutes.onboardingmainpage:
        return MaterialPageRoute(builder: (_) => const OnboardingMainpage());
      case AppRoutes.bottomnavbarpage:
        return MaterialPageRoute(builder: (_) => const BottomNavBarPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
