import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toyfarn_project/viewmodel/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogOutScreen extends StatelessWidget with AppBarCustom {
  static const String screenName = 'logout_screen';

  const LogOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithReturnButton(title: 'Logout Screen'),
      body: _LogOutView(),
    );
  }
}

class _LogOutView extends StatelessWidget {
  const _LogOutView();

  Future<void> _showLogoutConfirmation(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout Confirmation'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Logout'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      FirebaseAuth.instance.signOut();
      GoRouter.of(context).go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => _showLogoutConfirmation(context),
        child: const Text('Logout'),
      ),
    );
  }
}
