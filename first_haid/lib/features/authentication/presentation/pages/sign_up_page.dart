import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_haid/core/widgets/my_icon_container.dart';
import 'package:first_haid/core/widgets/mytextfield.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgets/gradient_text.dart';
import '../../data/auth_services.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool obscureText = true;
  bool isLoading = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void createUser() async {
    AuthService authService = AuthService();
    setState(() {
      isLoading = true;
    });
    if (passwordController.text != confirmPasswordController.text) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Sign Up Failed'),
            content: const Text("Passwords don't match!"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      setState(() {
        isLoading = false;
      });
      return;
    }

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Login Failed'),
              content: const Text("Passwords don't match !!"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
      Navigator.pop(context);

      Navigator.pushReplacementNamed(context, AppRoutes.setupprofile);
    } catch (e) {
      String errorMessage;
      if (e.toString().contains('weak-password')) {
        errorMessage = 'The password is too weak';
      } else if (e.toString().contains('email-already-in-use')) {
        errorMessage = 'The account already exists for that email.';
      } else {
        errorMessage = e.toString();
      }

      //error dialog
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Login Failed'),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

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
            child: SingleChildScrollView(
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
                  MyTextField(
                    controller: emailController,
                    height: 50,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    hintText: 'example@gmail.com',
                    obscureText: false,
                    textFieldName: 'Email',
                  ),
                  // Password text field
                  MyTextField(
                    controller: passwordController,
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
                  MyTextField(
                    controller: confirmPasswordController,
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
                    textFieldName: 'Confirm Password',
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  GestureDetector(
                    onTap: createUser,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Have an account already? ",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, AppRoutes.login),
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xFF1246C7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
