import 'package:flutter/material.dart';

class UserProfile {
  final String name;
  final String location;
  final String description;
  final String profileImageUrl; // Assuming a string for image URL or path
  final int followers;
  final int following;
  final String website;
  final String memberSince;
  final int channelViews;
  final int likes;
  final int modelsCreated;

  UserProfile({
    required this.name,
    required this.location,
    required this.description,
    required this.profileImageUrl,
    required this.followers,
    required this.following,
    required this.website,
    required this.memberSince,
    required this.channelViews,
    required this.likes,
    required this.modelsCreated,
  });
}
