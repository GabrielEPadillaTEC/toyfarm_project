
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toyfarn_project/view/screens.dart';



final List<RouteBase> routes = [
  GoRoute(
    path: '/',
    name: HomeScreen.screenName,
    builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/login',
    name: LoginScreen.screenName,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: '/profile',
    name: ProfileScreen.screenName,
    builder: (context, state) => const ProfileScreen(),
  ),
  GoRoute(
    path: '/catalog',
    name: ModelCatalogScreen.screenName,
    builder: (context, state) => const ModelCatalogScreen(),
  ),
  GoRoute(
    path: '/listing',
    name: MarketListingScreen.screenName,
    builder: (context, state) => const MarketListingScreen(),
  ),
];