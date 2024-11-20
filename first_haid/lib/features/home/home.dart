import 'package:first_haid/features/widgets/bot_container.dart';
import 'package:first_haid/features/widgets/gradient_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    width: 85,
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
              /* Container(
                color: Colors.green,
                height: 245,
                width: double.infinity,
              ),  */
            ],
          ),
        ),
      ),
    );
  }
}
