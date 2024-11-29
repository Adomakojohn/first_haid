import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final dynamic textFieldName;
  final bool obscureText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final BorderRadius borderRadius;
  final TextInputType? keyboardType;
  final double? height;
  final List<TextInputFormatter>? inputFormatters;
  final Color borderColor; // Added for dynamic border color

  const MyTextField({
    this.height,
    this.inputFormatters,
    this.keyboardType,
    required this.borderRadius,
    super.key,
    required this.hintText,
    required this.obscureText,
    this.suffixIcon,
    this.controller,
    this.textFieldName,
    this.borderColor = Colors.grey, // Default color is grey
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
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
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
                borderSide: BorderSide(color: borderColor, width: 1),
                borderRadius: borderRadius,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 1),
                borderRadius: borderRadius,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
