import 'package:flutter/material.dart';

class MyIconContainer extends StatelessWidget {
  final String image;
  const MyIconContainer({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade400,
          ),
          left: BorderSide(
            color: Colors.grey.shade400,
          ),
          right: BorderSide(
            color: Colors.grey.shade400,
          ),
          top: BorderSide(
            color: Colors.grey.shade400,
          ),
        ),
        borderRadius: BorderRadius.circular(70),
      ),
      child: Image.asset(
        image,
        height: 45,
        width: 45,
      ),
    );
  }
}
