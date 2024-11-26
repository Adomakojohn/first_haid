import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetupProfileWidget extends StatefulWidget {
  const SetupProfileWidget({super.key});

  @override
  State<SetupProfileWidget> createState() => _SetupProfileWidgetState();
}

class _SetupProfileWidgetState extends State<SetupProfileWidget> {
  Future<void> _saveImagePath(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_image_path', path);
  }

  File? _selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
      _saveImagePath(pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Stack(
      children: [
        // Profile picture area
        Positioned(
          left: screenWidth * 0.15,
          child: Container(
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
                child: _selectedImage != null
                    ? Image.file(
                        _selectedImage!,
                        height: screenWidth * 0.48,
                        width: screenWidth * 0.48,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/images/profile-user.png',
                        height: screenWidth * 0.48,
                        width: screenWidth * 0.48,
                        color: Colors.blue.withOpacity(0.3),
                        colorBlendMode: BlendMode.color,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
        ),

        // Add/Edit profile picture button
        Positioned(
          top: screenHeight * 0.169,
          left: screenWidth * 0.575,
          child: GestureDetector(
            onTap: _pickImage,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.camera_alt,
                color: Color(0xFF1241C5),
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
