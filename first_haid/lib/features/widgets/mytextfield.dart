import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final String textFieldName;
  final bool obscureText;
  final TextEditingController? controller;
  final Widget? suffixIcon;

  const MyTextField({
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
            fontWeight: FontWeight.w500,
            fontSize: 18,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        SizedBox(
          height: 50,
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
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10,
                  ),
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
