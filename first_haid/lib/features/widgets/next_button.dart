import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final void Function()? onTap;
  const NextButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 124,
        height: 36,
        decoration: ShapeDecoration(
          color: const Color(0xFF1057CD),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: const Text(
          'Next',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
