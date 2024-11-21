import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_haid/core/routes/app_routes.dart';
import 'package:first_haid/core/widgets/bot_container.dart';
import 'package:first_haid/core/widgets/gradient_text.dart';
import 'package:first_haid/features/authentication/data/auth_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService authService = AuthService();

  void logout() async {
    AuthService authService = AuthService();
    await authService.signOut();
    Navigator.pushReplacementNamed(context, AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/icons/menuIcon.png',
                      height: 38,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const GradientText(
                    'Welcome, Kofi',
                    style: TextStyle(fontSize: 20),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF01E1FE),
                        Color(0xFF1241C5),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const BotContainer(),
              const SizedBox(
                height: 10,
              ),
              const GradientText(
                'Suggestions',
                style: TextStyle(
                  fontSize: 17,
                ),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF01E1FE),
                    Color(0xFF1241C5),
                  ],
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Container(
                color: Colors.green,
                height: 245,
                width: double.infinity,
                child: GestureDetector(
                  onTap: logout,
                  child: const Text(
                    "Sign out",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
