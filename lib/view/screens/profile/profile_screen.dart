import 'package:flutter/material.dart';
import 'package:toyfarn_project/viewmodel/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget with AppBarCustom{
  static const String screenName = 'profile_screen';

  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithReturnButton(title: 'Profile'),
      body: const _ProfileView(),
      // floatingActionButton: const ButtonReturnPage(),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile.PNG'), // imagen perfil, ver como hacer esto desde llamada remota a servidor o algo
            ),
            const SizedBox(height: 10),
            const Text(
              'John Doe',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              'Location',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 5),
            const Text(
              'Profile Description less than 200 characters.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text('Follow'),
            ),
            const SizedBox(height: 10),
            PopupMenuButton<String>(
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem<String>(
                  value: 'ignore',
                  child: Text('Ignore User'),
                ),
                const PopupMenuItem<String>(
                  value: 'report',
                  child: Text('Report User'),
                ),
              ],
              onSelected: (String result) {
                // Handle menu item selection here
                print('Selected: $result');//no hace nada aun
              },
              child: ElevatedButton.icon(
                onPressed: null,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                icon: const Icon(Icons.settings),
                label: const Text(''),
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //valores locales, probar dto mas tarde
                Text('4.4k Followers'),
                SizedBox(width: 10),
                Text('400 Following'),
              ],
            ),
            const SizedBox(height: 20),
            // tambien local luego veo como jalarlo
            _buildSection(context, 'ABOUT', 'User information less than 1000 words goes here.'),
            _buildSection(context, 'CATEGORY', 'Category 1 / Category 2 / Category 3'),
            _buildSection(context, 'WEBSITE', 'https://www.example.com', true),
            _buildSection(context, 'MEMBER SINCE', 'Joined Date'),

            const SizedBox(height: 20),

            // tambien local luego veo como jalarlo

            _buildSection(context, 'STATS'),
            _buildStatsRow(context, icon: Icons.remove_red_eye, label: 'Channel Views', value: '100k+'),
            _buildStatsRow(context, icon: Icons.star, label: 'Likes', value: '500k+'),
            _buildStatsRow(context, icon: Icons.extension, label: 'Models Created', value: '50+'),
          ],
        ),
      ),),
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
//mover a widgets mas tarde
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

