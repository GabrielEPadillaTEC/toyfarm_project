import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toyfarn_project/config/menu/menu_catalogo_items.dart';

import '../../providers/profile_viewmodel.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;
  final profileViewModel = ProfileViewModel();
  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
   String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    //String userId = '202311304505';
    return FutureBuilder(
        future:
            profileViewModel.fetchUserProfile(userId.isNotEmpty ? userId : '0'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (!profileViewModel.exists) {
            // Show the 404 image and user ID text when profile is not found
            return
              NavigationDrawer(
                selectedIndex: navDrawerIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    navDrawerIndex = value;
                  });

                  final menuItem = appMenuItems[value];
                  context.push(
                    menuItem.link,
                  );
                  widget.scaffoldKey.currentState?.closeDrawer();
                },
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'There was an issue',
                      style: TextStyle(color: Colors.blue,fontSize: 25),// Very light gray
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 40, 4, 0),
                    child: Image.asset(
                      'assets/images/404drawer.png',
                      width: 100, // Adjust the width as needed
                      height: 100, // Adjust the height as needed
                    ),
                  ),
                  Text(
                    '$userId not found',
                    style: TextStyle(color: Colors.grey[300]), // Very light gray
                  ),
                ],
            );
          } else {
            // User profile loaded successfully
            return NavigationDrawer(
              selectedIndex: navDrawerIndex,
              onDestinationSelected: (value) {
                setState(() {
                  navDrawerIndex = value;
                });

                final menuItem = appMenuItems[value];
                context.push(
                  menuItem.link,
                );
                widget.scaffoldKey.currentState?.closeDrawer();
              },
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 5),
                  child: Text(profileViewModel.userProfile.name),
                ),
                GestureDetector(
                  onTap: () {
                    context.push('/YourProfile');
                    print("Avatar Clicked");
                    // Add your logic here
                  },
                  child: CircleAvatar(
                    // Add your avatar image or initials
                    radius: 40,
                    backgroundImage: NetworkImage(
                        profileViewModel.userProfile.profileImageUrl),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
                  child: const Text('Home Menu'),
                ),
                ...appMenuItems.sublist(0, 1).map(
                      (item) => NavigationDrawerDestination(
                        icon: Icon(item.icon),
                        label: Text(item.title),
                      ),
                    ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(28, 16, 28, 5),
                  child: Divider(),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
                  child: Text('User Section'),
                ),
                ...appMenuItems.sublist(1, 4).map(
                      (item) => NavigationDrawerDestination(
                        icon: Icon(item.icon),
                        label: Text(item.title),
                      ),
                    ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(28, 16, 28, 5),
                  child: Divider(),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
                  child: Text('Catalogue'),
                ),
                ...appMenuItems.sublist(4, 7).map(
                      (item) => NavigationDrawerDestination(
                        icon: Icon(item.icon),
                        label: Text(item.title),
                      ),
                    ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(28, 16, 28, 5),
                  child: Divider(),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
                  child: Text('Exit'),
                ),
                ...appMenuItems.sublist(7).map(
                      (item) => NavigationDrawerDestination(
                        icon: Icon(item.icon),
                        label: Text(item.title),
                      ),
                    ),
              ],
            );
          }
        });
  }
}

