import 'package:flutter/material.dart';
import 'package:toyfarn_project/domain/entities/entities.dart'; // Import your UserProfile class
import 'package:toyfarn_project/infrastructure/mappers/user_profile_mapper.dart';
import 'package:provider/provider.dart'; // Import Provider package
import 'package:toyfarn_project/viewmodel/providers/profile_viewmodel.dart'; // Import your ProfileViewModel class

class ProfileSection extends StatelessWidget {
  static const String screenName = 'profile view';
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: ProfileView(),
    );
  }
}

  class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final profileViewModel = ProfileViewModel();

    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: profileViewModel.fetchUserProfile(202311304505),
          builder: (context, snapshot) {
            return (snapshot.connectionState==ConnectionState.done)? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(profileViewModel.userProfile.profileImageUrl), // Use userProfile data
                  ),
                  const SizedBox(height: 10),
                  Text(
                    profileViewModel.userProfile.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    profileViewModel.userProfile.location,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    profileViewModel.userProfile.description,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: const Text('Follow'),
                  ),
                  // ... Rest of the code using userProfile data
                ],
              ),
            ):Center(
              child: CircularProgressIndicator(
                color: Colors.cyan,
              ),
            );
          }
        ),
      ),
    );
  }


  Widget _buildSection(BuildContext context, String title, [String? content, bool isLink = false]) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: colors.primary),
          ),
          const SizedBox(height: 5),
          isLink
              ? InkWell(
            onTap: () {
              // nada
              print('prueba link');
            },
            child: Text(
              content ?? '',
              style: const TextStyle(fontSize: 16, color: Colors.blue),
            ),
          )
              : Text(
            content ?? '',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow(BuildContext context, {required IconData icon, required String label, required String value}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon),
              const SizedBox(width: 5),
              Text(label),
            ],
          ),
          Text(value),
        ],
      ),
    );
  }

}
