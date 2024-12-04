import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddUserDetails {
  Future<void> addUserDetails({
    required String firstName,
    required String lastName,
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
        'firstName': firstName,
        'lastName': lastName,
        'dateOfBirth': dateOfBirth,
        'email': user.email,
        'gender': gender,
        'medicalAllergies': medicalAllergies,
      });
      print("User details saved successfully!");
    } catch (e) {
      print("Error saving user details: $e");
    }
  }
}
