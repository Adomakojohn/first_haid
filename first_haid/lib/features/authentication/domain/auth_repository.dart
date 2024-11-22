import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_haid/features/authentication/presentation/pages/login_page.dart';
import 'package:first_haid/features/home/pages/bottom_nav_bar_page.dart';

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
            return const BottomNavBarPage();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
