// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:first_haid/features/onboarding/onboard5.dart';
import 'package:first_haid/features/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/routes/app_routes.dart';
import '../../core/widgets/next_button.dart';

class OnboardingMainpage extends StatefulWidget {
  const OnboardingMainpage({super.key});

  @override
  State<OnboardingMainpage> createState() => _OnboardingMainpageState();
}

class _OnboardingMainpageState extends State<OnboardingMainpage> {
  final pageController = PageController();
  int currentPage = 0;
  bool onLastPage = false;

  final List onboard = [
    const OnboardingPage(
      onboardImage: 'assets/images/onboard1.png',
      onboardMainText: 'Friendly AI Assistant',
      onboardSecondText: 'Meet Your Health Buddy',
      onboardThirdText: 'Get friendly, instant health advice and guidance',
      onboardFourthText: 'anytime, anywhere, First Haid is here as a first',
      onboardFifthText: 'and to help you feel better faster',
    ),
    const OnboardingPage(
      onboardImage: 'assets/images/onboarding2.png',
      onboardMainText: 'Symptom Checker',
      onboardSecondText: 'Understand your symptoms',
      onboardThirdText: 'Not feeling well? Describe your symptoms and',
      onboardFourthText: "we'll guide you with personalised suggestions",
      onboardFifthText: "and next steps",
    ),
    const OnboardingPage(
      onboardImage: 'assets/images/onboard3.png',
      onboardMainText: 'Health Journey Guide',
      onboardSecondText: 'Your Health journey, Simplified',
      onboardThirdText: 'From symtpom checking to tailored health advice',
      onboardFourthText: 'our app is here to support you every step of the',
      onboardFifthText: 'way',
    ),
    const OnboardFivePage(
      onboardImage: 'assets/images/onboard4.png',
      onboardMainText: 'Community Support',
      onboardSecondText: 'Accessible for all',
      onboardThirdText: 'Bringing reliable medical advice to everyone from',
      onboardFourthText: 'rural areas to busy cities. Get the care you need',
      onboardFifthText: 'wherever you are',
    ),
    const OnboardFivePage(
      onboardImage: 'assets/images/onboard5.png',
      onboardMainText: 'Quick Relief and Guidance',
      onboardSecondText: 'Feel Better, Faster',
      onboardThirdText: 'Get guidance and relief before seeing a doctor',
      onboardFourthText: 'Our app provides, comforting support when you',
      onboardFifthText: 'need it most',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 900,
            child: PageView.builder(
              controller: pageController,
              itemCount: onboard.length,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 4);
                });
              },
              itemBuilder: (context, index) {
                return (index == 3 || index == 4)
                    ? OnboardFivePage(
                        onboardFifthText: onboard[index].onboardFifthText,
                        onboardFourthText: onboard[index].onboardFourthText,
                        onboardImage: onboard[index].onboardImage,
                        onboardMainText: onboard[index].onboardMainText,
                        onboardSecondText: onboard[index].onboardSecondText,
                        onboardThirdText: onboard[index].onboardThirdText,
                      )
                    : OnboardingPage(
                        onboardFifthText: onboard[index].onboardFifthText,
                        onboardFourthText: onboard[index].onboardFourthText,
                        onboardImage: onboard[index].onboardImage,
                        onboardMainText: onboard[index].onboardMainText,
                        onboardSecondText: onboard[index].onboardSecondText,
                        onboardThirdText: onboard[index].onboardThirdText,
                      );
              },
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.452,
            left: 155,
            child: SmoothPageIndicator(
              onDotClicked: (index) {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              },
              effect: const WormEffect(
                activeDotColor: Color(0xFF00E5FF),
                dotColor: Color.fromARGB(255, 214, 214, 214),
                dotHeight: 10,
                dotWidth: 10,
              ),
              controller: pageController,
              count: onboard.length,
            ),
          ),
          Positioned(
            bottom: 30,
            right: 20,
            child: onLastPage
                ? NextButton(
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setBool('hasSeenOnboarding', true);

                      // Navigate to login or sign-up screen
                      Navigator.pushReplacementNamed(
                          context, AppRoutes.authrepository);
                    },
                  )
                : NextButton(
                    onTap: () {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                  ),
          ),
          Positioned(
            bottom: screenHeight * 0.04,
            left: screenWidth * 0.132,
            child: GestureDetector(
              onTap: () => pageController.jumpToPage(4),
              child: const Text(
                'Skip',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF01E1FE),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
