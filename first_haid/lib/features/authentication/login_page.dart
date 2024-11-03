import 'package:first_haid/features/widgets/my_icon_container.dart';
import 'package:first_haid/features/widgets/mytextfield.dart';
import 'package:flutter/material.dart';

import '../widgets/gradient_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 21,
            right: 21,
            top: 17,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Back",
                  style: TextStyle(
                    color: Color.fromARGB(255, 165, 163, 163),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const GradientText(
                  'Create Account',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF01E1FE),
                      Color(0xFF1241C5),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),
                Center(
                  child: Container(
                    width: 207,
                    height: 207,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: SweepGradient(
                        colors: [
                          Color(0xFF1241C5),
                          Color(0xFF01E1FE),
                          Color(0xFF1241C5),
                        ],
                        startAngle: 0.14,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(
                          2), // Thickness of gra4dient border
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/profile-user.png',
                          height: 200,
                          width: 200,
                          color: Colors.blue.withOpacity(0.3),
                          colorBlendMode: BlendMode.color,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                  ),
                  child: Text(
                    "Hi, Welcome to First Haid AI Health App",
                    style: TextStyle(
                      color: Color.fromARGB(255, 165, 163, 163),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //email textfield
                const MyTextField(
                  hintText: 'example@gmail.com',
                  obscureText: false,
                  textFieldName: 'Email',
                ),
                const SizedBox(
                  height: 20,
                ),
                //password textfield
                MyTextField(
                  hintText: '.........................',
                  obscureText: obscureText,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: Icon(
                      obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  ),
                  textFieldName: 'Password',
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1246C7)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    height: 55,
                    width: 400,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF00E3FF), Color(0xFF1241C5)],
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        endIndent: 9,
                      ),
                    ),
                    Text(
                      "or sign up with",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1246C7),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        indent: 11,
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyIconContainer(image: 'assets/logos/apple-logo.png'),
                    MyIconContainer(image: 'assets/logos/Google-logo.png'),
                    MyIconContainer(image: 'assets/logos/facebook-logo.png'),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Have an account already? ",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Log In',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xFF1246C7),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
