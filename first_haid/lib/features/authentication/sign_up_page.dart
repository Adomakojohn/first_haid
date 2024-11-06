import 'package:first_haid/features/widgets/my_icon_container.dart';
import 'package:first_haid/features/widgets/mytextfield.dart';
import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';
import '../widgets/gradient_text.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: true,
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: screenWidth * 0.9,
              maxHeight: screenHeight,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight * 0.02,
                ),

                Image.asset(
                  'assets/logos/first_haid_logo.png',
                  height: 150,
                ),

                /*  Container(
                  width: screenWidth * 0.5,
                  height: screenWidth * 0.5,
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
                    padding: const EdgeInsets.all(2),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/profile-user.png',
                        height: screenWidth * 0.48,
                        width: screenWidth * 0.48,
                        color: Colors.blue.withOpacity(0.3),
                        colorBlendMode: BlendMode.color,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),  */
                const GradientText(
                  'Sign Up',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF01E1FE),
                      Color(0xFF1241C5),
                    ],
                  ),
                ),
                const Text(
                  "Hi, Welcome to First Haid AI Health App",
                  style: TextStyle(
                    color: Color.fromARGB(255, 165, 163, 163),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                // Email text field
                const MyTextField(
                  height: 50,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  hintText: 'example@gmail.com',
                  obscureText: false,
                  textFieldName: 'Email',
                ),
                // Password text field
                MyTextField(
                  height: 50,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
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
                /* const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1246C7),
                    ),
                  ),
                ),  */
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.setupprofile);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 47,
                    width: screenWidth * 0.8,
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
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Divider(thickness: 1, endIndent: 9),
                    ),
                    Text(
                      "or sign up with",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[400],
                      ),
                    ),
                    const Expanded(
                      child: Divider(indent: 11, thickness: 1),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyIconContainer(image: 'assets/logos/apple-logo.png'),
                    MyIconContainer(image: 'assets/logos/Google-logo.png'),
                    MyIconContainer(image: 'assets/logos/facebook-logo.png'),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.02,
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
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.011,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Color(0xFFBCB9B9),
                      fontSize: 18,
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: -0.48,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
