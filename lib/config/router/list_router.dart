
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toyfarn_project/view/screens.dart';
import 'package:toyfarn_project/view/screens/chat/chat_screen.dart';


String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
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
    path: '/register',
    name: RegisterScreen.screenName,
    builder: (context, state) => const RegisterScreen(),
  ),
  GoRoute(
    path: '/profile',
    name: ProfileScreen.screenName,
    builder: (context, state) => const ProfileScreen(profileuid: '0'),
  ),
  GoRoute(
    path: '/YourProfile',
    name: ProfileScreen.screenNameYou,
    builder: (context, state) => ProfileScreen(profileuid: userId),
  ),
  GoRoute(
    path: '/catalog',
    name: ModelCatalogScreen.screenName,
    builder: (context, state) {
     // Pass the parameter to the screen
      return const ModelCatalogScreen(option: 'home');
    },
  ),
  GoRoute(
    path: '/HomeCatalog',
    name: ModelCatalogScreen.screenNameHome,
    builder: (context, state) {
     // Pass the parameter to the screen
      return const ModelCatalogScreen(option: 'home');
    },
  ),
  GoRoute(
    path: '/ModelsCatalog',
    name: ModelCatalogScreen.screenNameModel,
    builder: (context, state) {
     // Pass the parameter to the screen
      return const ModelCatalogScreen(option: 'models');
    },
  ),
  GoRoute(
    path: '/ServicesCatalog',
    name: ModelCatalogScreen.screenNameService,
    builder: (context, state) {
      // Pass the parameter to the screen
      return const ModelCatalogScreen(option: 'services');
    },
  ),
  GoRoute(
    path: '/ListingsCatalog',
    name: ModelCatalogScreen.screenNameListings,
    builder: (context, state) {
      // Pass the parameter to the screen
      return const ModelCatalogScreen(option: 'listings');
    },
  ),
  GoRoute(
    path: '/listing',
    name: MarketListingScreen.screenName,
    builder: (context, state) => const MarketListingScreen(),
  ),
  GoRoute(
    path: '/post_lister',
    name: PostListerScreen.screenName,
    builder: (context, state) => const PostListerScreen(option: 'offers', userUID:'0'),
  ),
  GoRoute(
    path: '/YourListings',
    name: PostListerScreen.screenNameLister,
    builder: (context, state) => PostListerScreen(option: 'listings',userUID: userId),
  ),
  GoRoute(
    path: '/YourOffers',
    name: PostListerScreen.screenNameOffers,
    builder: (context, state) => PostListerScreen(option: 'offers',userUID: userId),
  ),
  GoRoute(
    path: '/chat',
    name: ChatScreen.screenName,
    builder: (context, state) => const ChatScreen(),
  ),
];