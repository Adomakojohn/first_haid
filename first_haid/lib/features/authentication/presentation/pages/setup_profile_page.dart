import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_haid/core/routes/app_routes.dart';
import 'package:first_haid/core/widgets/mytextfield.dart';
import 'package:first_haid/core/widgets/setup_profile_widget.dart';
import 'package:multi_masked_formatter/multi_masked_formatter.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/gradient_text.dart';

// Class to save user details
class AddUserDetails {
  Future<void> addUserDetails({
    required String fullName,
    required String dateOfBirth,
    required String gender,
    required String medicalAllergies,
  }) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw Exception("No authenticated user found.");
    }

    try {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'fullName': fullName,
        'dateOfBirth': dateOfBirth,
        'email': user.email,
        'gender': gender,
        'medicalAllergies': medicalAllergies,
      });
    } catch (e) {
      print("Error saving user details: $e");
    }
  }
}

class SetupProfilePage extends StatefulWidget {
  const SetupProfilePage({super.key});

  @override
  State<SetupProfilePage> createState() => _SetupProfilePageState();
}

class _SetupProfilePageState extends State<SetupProfilePage> {
  // Controllers for each input field
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _allergiesController = TextEditingController();

  // Error state variables
  bool _fullNameError = false;
  bool _dobError = false;
  bool _genderError = false;
  bool _allergiesError = false;

  // Method to save profile details
  Future<void> _saveProfileDetails() async {
    try {
      await AddUserDetails().addUserDetails(
        fullName: _fullNameController.text,
        dateOfBirth: _dobController.text,
        gender: _genderController.text,
        medicalAllergies: _allergiesController.text,
      );
      print("User details saved!");

      // Navigate to the next page
      Navigator.pushReplacementNamed(context, AppRoutes.bottomnavbarpage);
    } catch (e) {
      print("Error saving profile: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Create Account',
                style: TextStyle(
                  color: Color(0xFF01E1FE),
                  fontSize: 24,
                  fontFamily: 'Proxima Nova',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: -1.20,
                ),
              ),
              SizedBox(height: screenHeight * 0.0207),
              const GradientText(
                'Set Up Profile',
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.w400),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF01E1FE),
                    Color(0xFF1241C5),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.0507),
              Container(
                alignment: Alignment.center,
                height: screenHeight * 0.25,
                width: 300,
                child: const SetupProfileWidget(),
              ),
              const Text(
                'Add Profile Picture',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFBEBEBE),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: -0.24,
                ),
              ),
              SizedBox(
                width: screenWidth * 0.9,
                child: MyTextField(
                  controller: _fullNameController,
                  height: 50,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  hintText: '',
                  obscureText: false,
                  textFieldName: 'Full Name',
                  borderColor: _fullNameError ? Colors.red : Colors.grey,
                ),
              ),
              if (_fullNameError)
                const Text(
                  'Full name is required',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              SizedBox(
                width: screenWidth * 0.9,
                child: MyTextField(
                  controller: _dobController,
                  height: 50,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  inputFormatters: [
                    MultiMaskedTextInputFormatter(
                      masks: ['xxxx.xx.xx'],
                      separator: '.',
                    )
                  ],
                  hintText: '1998.01.25',
                  keyboardType: TextInputType.number,
                  suffixIcon: const Icon(Icons.calendar_month_rounded),
                  obscureText: false,
                  textFieldName: 'Birthday',
                  borderColor: _dobError ? Colors.red : Colors.grey,
                ),
              ),
              if (_dobError)
                const Text(
                  'Date of birth is required',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              SizedBox(
                width: screenWidth * 0.9,
                child: MyTextField(
                  controller: _genderController,
                  height: 50,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  hintText: '',
                  obscureText: false,
                  textFieldName: 'Gender',
                  borderColor: _genderError ? Colors.red : Colors.grey,
                ),
              ),
              if (_genderError)
                const Text(
                  'Gender is required',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              SizedBox(
                width: screenWidth * 0.9,
                child: MyTextField(
                  controller: _allergiesController,
                  height: 65,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  hintText: '',
                  obscureText: false,
                  textFieldName: 'Medical Allergies',
                  borderColor: _allergiesError ? Colors.red : Colors.grey,
                ),
              ),
              if (_allergiesError)
                const Text(
                  'Medical allergies are required',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              SizedBox(height: screenHeight * 0.0407),
              Row(
                children: [
                  SizedBox(width: screenWidth * 0.0551),
                  const Text(
                    'Skip',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF01E1FE),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.479),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _fullNameError = _fullNameController.text.isEmpty;
                        _dobError = _dobController.text.isEmpty;
                        _genderError = _genderController.text.isEmpty;
                        _allergiesError = _allergiesController.text.isEmpty;
                      });

                      if (!_fullNameError &&
                          !_dobError &&
                          !_genderError &&
                          !_allergiesError) {
                        _saveProfileDetails();
                      }
                    },
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
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.0187),
            ],
          ),
        ),
      ),
    );
  }
}
