import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_haid/core/routes/app_routes.dart';
import 'package:first_haid/features/authentication/presentation/pages/login_page.dart';
import 'package:first_haid/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:first_haid/features/home/home.dart';
import 'package:flutter/material.dart';

class AuthRepository extends StatelessWidget {
  const AuthRepository({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
