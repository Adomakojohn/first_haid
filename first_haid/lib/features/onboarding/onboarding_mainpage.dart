import 'package:first_haid/features/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingMainpage extends StatefulWidget {
  const OnboardingMainpage({super.key});

  @override
  State<OnboardingMainpage> createState() => _OnboardingMainpageState();
}

class _OnboardingMainpageState extends State<OnboardingMainpage> {
  final pageController = PageController();
  int currentPage = 0;

  final List<OnboardingPage> onboard = [
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
    const OnboardingPage(
      onboardImage: 'assets/images/onboard4.png',
      onboardMainText: 'Community Support',
      onboardSecondText: 'Accessible for All',
      onboardThirdText: 'Bringing relaible health advice to everyone from',
      onboardFourthText: 'rural areas to busy cities, Get hte care you need',
      onboardFifthText: 'wherever you are',
    ),
    const OnboardingPage(
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
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: SizedBox(
              height: 900,
              child: PageView.builder(
                controller: pageController,
                itemCount: onboard.length,
                itemBuilder: (context, index) {
                  return OnboardingPage(
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
          ),
          Positioned(
            bottom: 450,
            left: 145,
            child: SmoothPageIndicator(
              controller: pageController,
              count: onboard.length,
            ),
          )
        ],
      ),
    );
  }
}
