import 'package:flutter/material.dart';

class HealthArticleWidget extends StatelessWidget {
  const HealthArticleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 225,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/bcImage.png'),
          const Text("28th October 2024 || News Release"),
          const Text(
            "Breast Cancer Awareness",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19),
          ),
        ],
      )),
    );
  }
}
