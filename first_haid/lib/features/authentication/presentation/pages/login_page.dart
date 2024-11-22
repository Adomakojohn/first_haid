import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_haid/features/authentication/presentation/pages/forgot_password_page.dart';
import 'package:flutter/material.dart';
import 'package:first_haid/features/authentication/data/auth_services.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgets/gradient_text.dart';
import '../../../../core/widgets/my_icon_container.dart';
import '../../../../core/widgets/mytextfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;
  bool isLoading = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Sign user in
  void login() async {
    AuthService authService = AuthService();
    setState(() {
      isLoading = true;
    });
    try {
      await authService.signIn(
        emailController.text,
        passwordController.text,
      );

      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.pushReplacementNamed(context, AppRoutes.bottomnavbarpage);
      } else {
        throw Exception('Failed to log in. User is null.');
      }
    } catch (e) {
      String errorMessage;
      if (e.toString().contains('user-not-found')) {
        errorMessage = 'No user found for that email.';
      } else if (e.toString().contains('wrong-password')) {
        errorMessage = 'Wrong password provided.';
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
                  const GradientText(
                    'Log In',
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const ForgotPasswordPage();
                          },
                        ));
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1246C7),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  GestureDetector(
                    onTap: login,
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
                      child: isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              "Log In",
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
                        "or log in with",
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
                        "Not a user ",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, AppRoutes.signuppage),
                        child: const Text(
                          'Sign Up',
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
