// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:first_haid/features/widgets/next_button.dart';

import '../widgets/gradient_text.dart';

class OnboardingPage extends StatefulWidget {
  final String onboardImage;
  final String onboardMainText;
  final String onboardSecondText;
  final String onboardThirdText;
  final String onboardFourthText;
  final String onboardFifthText;
  const OnboardingPage({
    super.key,
    required this.onboardImage,
    required this.onboardMainText,
    required this.onboardSecondText,
    required this.onboardThirdText,
    required this.onboardFourthText,
    required this.onboardFifthText,
  });

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage(widget.onboardImage),
            ),
            Container(
              height: 700,
              alignment: Alignment.center,
              color: Colors.transparent,
              child: Stack(
                children: [
                  //Positioned(
                  // top: 10,
                  // left: 158,
                  //child: SmoothPageIndicator(

                  //  count: 5,
                  //  effect: const WormEffect(),
                  // ),
                  //),
                  Positioned(
                    top: 85,
                    left: 32,
                    child: Column(
                      children: [
                        GradientText(
                          widget.onboardMainText,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF01E1FE),
                              Color(0xFF1241C5),
                            ],
                          ),
                        ),
                        Text(
                          widget.onboardSecondText,
                          style: const TextStyle(
                              color: Color(0xFF01E1FE),
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 360,
                          child: Column(
                            children: [
                              Text(
                                widget.onboardThirdText,
                              ),
                              Text(
                                widget.onboardFourthText,
                              ),
                              Text(
                                widget.onboardFifthText,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
