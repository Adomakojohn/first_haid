import 'package:first_haid/features/widgets/mytextfield.dart';
import 'package:flutter/material.dart';

class BotContainer extends StatelessWidget {
  const BotContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.6),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(23),
          ),
          gradient: LinearGradient(colors: [
            Color(0xFF01E1FE),
            Color(0xFF1241C5),
          ])),
      child: Container(
        height: 295,
        width: 390,
        decoration: const BoxDecoration(
          color: Color(0xFFE1F6FD),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 17,
              left: 17,
              child: Image.asset(
                'assets/logos/first_haid_logo.png',
                height: 42,
              ),
            ),
            Positioned(
              bottom: 20,
              left: 39,
              child: SizedBox(
                width: 250,
                child: MyTextField(
                  borderRadius: BorderRadius.circular(16),
                  hintText: 'Ask me something',
                  obscureText: false,
                  height: 55,
                  textFieldName: '',
                ),
              ),
            ),
            Positioned(
              bottom: 25,
              right: 32,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 217, 217),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.send),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
