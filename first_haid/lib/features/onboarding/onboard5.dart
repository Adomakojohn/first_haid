// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../core/widgets/gradient_text.dart';

class OnboardFivePage extends StatefulWidget {
  final String onboardImage;
  final String onboardMainText;
  final String onboardSecondText;
  final String onboardThirdText;
  final String onboardFourthText;
  final String onboardFifthText;
  const OnboardFivePage({
    super.key,
    required this.onboardImage,
    required this.onboardMainText,
    required this.onboardSecondText,
    required this.onboardThirdText,
    required this.onboardFourthText,
    required this.onboardFifthText,
  });

  @override
  State<OnboardFivePage> createState() => _OnboardFivePageState();
}

class _OnboardFivePageState extends State<OnboardFivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 132,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                      colors: [
                    Color(0xFFC3E0F2),
                    Color(0xFFFFFFFF),
                  ])),
            ),
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
                    left: 22,
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
