import 'package:first_haid/features/authentication/login_page.dart';
import 'package:first_haid/features/authentication/setup_profile_page.dart';
import 'package:first_haid/features/authentication/sign_up_page.dart';
import 'package:first_haid/features/home/home.dart';
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
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
