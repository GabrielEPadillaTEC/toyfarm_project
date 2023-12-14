import 'package:flutter/material.dart';
import 'package:toyfarn_project/config/router/list_router.dart';
import 'package:toyfarn_project/viewmodel/widgets/widgets.dart';
import 'package:toyfarn_project/viewmodel/views/profile_view_t.dart';

class ProfileScreen extends StatelessWidget with AppBarCustom {
  static const String screenName = 'profile_screen';
  static const String screenNameYou = 'profile_screen_you';
  final String profileuid;
  const ProfileScreen({super.key, required this.profileuid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithReturnButton(title: 'Profile'),
      body: ProfileView(userId: profileuid,),
      // floatingActionButton: const ButtonReturnPage(),
    );
  }
}