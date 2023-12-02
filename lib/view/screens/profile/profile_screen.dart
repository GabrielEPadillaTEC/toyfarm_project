import 'package:flutter/material.dart';
import 'package:toyfarn_project/viewmodel/widgets/widgets.dart';
import 'package:toyfarn_project/viewmodel/views/profile_view_t.dart';

class ProfileScreen extends StatelessWidget with AppBarCustom {
  static const String screenName = 'profile_screen';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithReturnButton(title: 'Profile'),
      body: const ProfileView(),
      // floatingActionButton: const ButtonReturnPage(),
    );
  }
}