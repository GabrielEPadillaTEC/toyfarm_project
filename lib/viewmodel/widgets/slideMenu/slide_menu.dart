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
    return FutureBuilder(
        future: profileViewModel.fetchUserProfile(userId.isNotEmpty ? userId : '0'),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.done)
              ? NavigationDrawer(
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
                      padding:
                          EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 5),
                      child: Text(profileViewModel.userProfile.name),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle avatar click logic
                        print("Avatar Clicked");
                        // Add your logic here
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
                        child:  CircleAvatar(
                          // Add your avatar image or initials
                          backgroundImage:
                              AssetImage(profileViewModel.userProfile.profileImageUrl),
                          radius: 30,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
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
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.cyan,
                  ),
                );
        });
  }
}
