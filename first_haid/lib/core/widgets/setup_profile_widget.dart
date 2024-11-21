import 'package:flutter/material.dart';

class SetupProfileWidget extends StatelessWidget {
  const SetupProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Stack(
      children: [
        Positioned(
          left: screenWidth * 0.15,
          child: Container(
            width: screenWidth * 0.5,
            height: screenWidth * 0.5,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: SweepGradient(
                colors: [
                  Color(0xFF1241C5),
                  Color(0xFF01E1FE),
                  Color(0xFF1241C5),
                ],
                startAngle: 0.14,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile-user.png',
                  height: screenWidth * 0.48,
                  width: screenWidth * 0.48,
                  color: Colors.blue.withOpacity(0.3),
                  colorBlendMode: BlendMode.color,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: screenHeight * 0.169,
          left: screenWidth * 0.575,
          child: Container(
            width: 30.29,
            height: 30.29,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: ClipOval(
                child: Image.asset(
                  'assets/icons/Ellipse.png',
                  height: screenWidth * 0.048,
                  width: screenWidth * 0.048,
                  color: Colors.white.withOpacity(0.3),
                  colorBlendMode: BlendMode.color,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
