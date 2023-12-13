import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserState extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  bool get isLoggedIn => _user != null;

  Future<void> loginUser(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _user = userCredential.user;
      notifyListeners();
    } catch (e) {
      // Handle login errors here
      print('Error: $e');
      throw e;
    }
  }

  void logoutUser() {
    // Perform the logout logic here
    _user = null;
    notifyListeners();
  }
}