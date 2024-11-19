import 'package:first_haid/features/widgets/mytextfield.dart';
import 'package:first_haid/features/widgets/setup_profile_widget.dart';
import 'package:flutter/material.dart';

import '../onboarding/onboarding_mainpage.dart';
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
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
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
              SizedBox(
                height: screenHeight * 0.0207,
              ),
              const GradientText(
                'Set Up Profile',
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.w400),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF01E1FE),
                    Color(0xFF1241C5),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.0507,
              ),
              Container(
                alignment: Alignment.center,
                height: screenHeight * 0.25,
                width: 300,
                child: const SetupProfileWidget(),
              ),
              const Text(
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
              SizedBox(
                width: screenWidth * 0.9,
                child: const MyTextField(
                  height: 50,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  hintText: '',
                  obscureText: false,
                  textFieldName: 'Full Name',
                ),
              ),
              SizedBox(
                width: screenWidth * 0.9,
                child: const MyTextField(
                  height: 50,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  hintText: '',
                  suffixIcon: Icon(Icons.calendar_month_rounded),
                  obscureText: false,
                  textFieldName: 'Birthday',
                ),
              ),
              SizedBox(
                width: screenWidth * 0.9,
                child: const MyTextField(
                  height: 50,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  hintText: '',
                  obscureText: false,
                  textFieldName: 'Gender',
                ),
              ),
              SizedBox(
                width: screenWidth * 0.9,
                child: const MyTextField(
                  height: 65,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  hintText: '',
                  obscureText: false,
                  textFieldName: 'Medical Allergies',
                ),
              ),
              SizedBox(
                height: screenHeight * 0.0407,
              ),
              Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.0551,
                  ),
                  const Text(
                    'Skip',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF01E1FE),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.479,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OnboardingMainpage(),
                          ));
                    },
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
                ],
              ),
              SizedBox(
                height: screenHeight * 0.0187,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
