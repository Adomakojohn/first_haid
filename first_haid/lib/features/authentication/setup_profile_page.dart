import 'package:first_haid/features/widgets/mytextfield.dart';
import 'package:flutter/material.dart';

import '../widgets/gradient_text.dart';

class SetupProfilePage extends StatefulWidget {
  const SetupProfilePage({super.key});

  @override
  State<SetupProfilePage> createState() => _SetupProfilePageState();
}

class _SetupProfilePageState extends State<SetupProfilePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Positioned(
              top: screenWidth * 0.01,
              bottom: screenHeight * 0.02,
              left: screenWidth * 0.3,
              child: const Text(
                'Create Account',
                style: TextStyle(
                  color: Color(0xFF01E1FE),
                  fontSize: 24,
                  fontFamily: 'Proxima Nova',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: -1.20,
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.065,
              left: screenWidth * 0.18,
              child: const GradientText(
                'Set Up Profile',
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.w400),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF01E1FE),
                    Color(0xFF1241C5),
                  ],
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.146,
              left: screenWidth * 0.25,
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
              top: screenHeight * 0.336,
              left: screenWidth * 0.65,
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
            Positioned(
              top: screenHeight * 0.405,
              left: screenHeight * 0.16,
              child: const Text(
                'Add Profile Picture',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFBEBEBE),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: -0.24,
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.435,
              left: screenHeight * 0.031,
              child: SizedBox(
                width: screenWidth * 0.9,
                child: const MyTextField(
                  height: 50,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  hintText: '',
                  obscureText: true,
                  textFieldName: 'Full Name',
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.535,
              left: screenHeight * 0.031,
              child: SizedBox(
                width: screenWidth * 0.9,
                child: const MyTextField(
                  height: 50,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  hintText: '',
                  suffixIcon: Icon(Icons.calendar_month_rounded),
                  obscureText: true,
                  textFieldName: 'Birthday',
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.635,
              left: screenHeight * 0.031,
              child: SizedBox(
                width: screenWidth * 0.9,
                child: const MyTextField(
                  height: 50,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  hintText: '',
                  obscureText: true,
                  textFieldName: 'Gender',
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.735,
              left: screenHeight * 0.031,
              child: SizedBox(
                width: screenWidth * 0.9,
                child: const MyTextField(
                  height: 65,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  hintText: '',
                  obscureText: true,
                  textFieldName: 'Medical Allergies',
                ),
              ),
            ),
            Positioned(
              bottom: screenHeight * 0.006,
              left: screenWidth * 0.632,
              child: Container(
                alignment: Alignment.center,
                width: 124,
                height: 36,
                decoration: ShapeDecoration(
                  color: const Color(0xFF1057CD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: screenHeight * 0.016,
              left: screenWidth * 0.132,
              child: const Text(
                'Skip',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF01E1FE),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
