import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final String textFieldName;
  final bool obscureText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final BorderRadius borderRadius;
  final double? height;

  const MyTextField({
    this.height,
    required this.borderRadius,
    super.key,
    required this.hintText,
    required this.obscureText,
    this.suffixIcon,
    this.controller,
    required this.textFieldName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textFieldName,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        SizedBox(
          height: height,
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 100, 98, 98),
              ),
              filled: true,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none, borderRadius: borderRadius),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: borderRadius,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
