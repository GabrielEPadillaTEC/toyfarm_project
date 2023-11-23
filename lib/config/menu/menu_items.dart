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
      title: 'Login',
      subTitle: 'prueba login',
      link: '/login',
      icon: Icons.smart_button_outlined
     ),
  const MenuItem(
      title: 'Profile',
      subTitle: 'profile de prueba',
      link: '/profile',
      icon: Icons.account_circle_outlined
  ),
  const MenuItem(
      title: 'Catalog',
      subTitle: 'catalogo de prueba',
      link: '/catalog',
      icon: Icons.shop
  ),
  const MenuItem(
      title: 'Listing',
      subTitle: 'Listado de prueba',
      link: '/listing',
      icon: Icons.money
  ),
  const MenuItem(
      title: 'Chat',
      subTitle: 'Chat de prueba',
      link: '/chat',
      icon: Icons.money
  ),
];
