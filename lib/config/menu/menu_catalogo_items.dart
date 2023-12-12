import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

List<MenuItem> appMenuItems = <MenuItem>[
  const MenuItem(
      title: 'Home',
      subTitle: 'Home section',
      link: '/HomeCatalog',
      icon: Icons.home
     ),
  const MenuItem(
      title: 'Your profile',
      subTitle: 'Your posts',
      link: '/YourProfile',
      icon: Icons.person
  ),
  const MenuItem(
      title: 'Your Listings',
      subTitle: 'Your posts',
      link: '/YourListings',
      icon: Icons.post_add
  ),
  const MenuItem(
      title: 'Your Offers',
      subTitle: 'Your offers',
      link: '/YourOffers',
      icon: Icons.local_offer
  ),
  const MenuItem(
      title: 'Models & Figures',
      subTitle: 'Volumetric entities woow',
      link: '/ModelsCatalog',
      icon: Icons.extension_sharp
  ),
  const MenuItem(
      title: 'Printing & Services',
      subTitle: 'Anything that can be done',
      link: '/ServicesCatalog',
      icon: Icons.format_paint
  ),
  const MenuItem(
      title: 'Listing & Petitions',
      subTitle: 'Community Petitions',
      link: '/ListingsCatalog',
      icon: Icons.shop
  ),
  const MenuItem(
      title: 'Log Out',
      subTitle: 'Listado de prueba',
      link: '/logout',
      icon: Icons.logout
  ),
];
