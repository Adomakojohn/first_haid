import 'package:flutter/material.dart';

class SuggestionsWidget extends StatelessWidget {
  final String text;
  const SuggestionsWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 25),
      child: Container(
        height: 30,
        width: 120, // Width of each item
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(50), // Oval shape
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
