import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toyfarn_project/viewmodel/widgets/widgets.dart';



class LoginScreen extends StatelessWidget  with AppBarCustom{

  static const String screenName = 'login_screen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithReturnButton(title: 'Login Screen'),
      body: const _LoginView(),
     // floatingActionButton: const ButtonReturnPage(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/toyfarmlogo.png', height: 100, width: 100),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 10),
            const  TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                //aqui va la logica del login, por mientras va a un dummy, tampoco implementado
                GoRouter.of(context).go('/dummy');
              },
              child: const Text('Log In'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // registro
                GoRouter.of(context).go('/register');
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
