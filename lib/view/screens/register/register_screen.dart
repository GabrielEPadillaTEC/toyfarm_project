import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toyfarn_project/viewmodel/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toyfarn_project/config/helpers/registerDio.dart';

import '../../../model/dtos/user_profile_dto.dart';

class RegisterScreen extends StatelessWidget with AppBarCustom, CustomSnackBars{
  static const String screenName = 'register_screen';

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithReturnButton(title: 'Register Screen'),
      body: _RegisterView(),
    );
  }
}

class _RegisterView extends StatefulWidget {
  const _RegisterView();

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<_RegisterView> with  CustomSnackBars{
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  bool _isRegistering = false;
  String _errorMessage = '';

  Future<void> _register() async {
    setState(() {
      _isRegistering = true;
      _errorMessage = '';
    });

    try {
      if (_passwordController.text != _confirmPasswordController.text) {
        throw 'Passwords do not match';
      }

      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _usernameController.text,
        password: _passwordController.text,
      );
        String? newuid =userCredential.user?.uid;
      if (newuid != null) {

        UserProfileDTO userProfile = UserProfileDTO(
          name: _nicknameController.text,
          email: _usernameController.text,
          location: 'City TBA',
          description: 'Im a New User',
          profileImageUrl: 'https://t4.ftcdn.net/jpg/02/29/75/83/240_F_229758328_7x8jwCwjtBMmC6rgFzLFhZoEpLobB6L8.jpg',
          followers: 0,
          following: 0,
          website: 'http://example.com',
          memberSince: DateTime.now().toString(),
          channelViews: 0,
          likes: 0,
          modelsCreated: 0,
        );

        bool success = await createProfile(newuid,userProfile);
        if(success){
          showRegistrationSuccessNotification();
          // Redirect to the login screen
          GoRouter.of(context).go('/login');
        }

      } else {
        // User not logged in or has just logged out.
      }
      // Registration successful


    } catch (e) {
      // Handle registration errors here
      setState(() {
        _errorMessage = removeSquareBrackets(e.toString());
      });
      print('Error: $e');
    } finally {
      setState(() {
        _isRegistering = false;
      });
    }
  }
  String removeSquareBrackets(String input) {
    return input.replaceAll(RegExp(r'\[.*?\]'), '');
  }
  void showRegistrationSuccessNotification() {
    toShowSnackBarCustom(context,
        snackBarContent: const Text('User registration successful'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png', height: 100, width: 100),
              const SizedBox(height: 20),
              TextField(
                controller: _nicknameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                ),
              ),
              const SizedBox(height: 20),
              if (_errorMessage.isNotEmpty)
                Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _isRegistering ? null : _register,
                child: _isRegistering
                    ? const CircularProgressIndicator()
                    : const Text('Register'), // Changed text to 'Log In'
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Redirect to the login screen
                  GoRouter.of(context).go('/login');
                },
                child: const Text('Log In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}