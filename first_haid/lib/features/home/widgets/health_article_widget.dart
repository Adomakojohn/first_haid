import 'package:flutter/material.dart';

class HealthArticleWidget extends StatelessWidget {
  const HealthArticleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 215,
      alignment: Alignment.center,
      width: 290,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 191, 229, 241),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: GestureDetector(
          child: Column(
        children: [
          Image.asset('assets/images/bcImage.png'),
        ],
      )),
    );
  }
}
