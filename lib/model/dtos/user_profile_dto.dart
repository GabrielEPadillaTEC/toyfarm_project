class UserProfileDTO {
  final String name;
  final String location;
  final String description;
  final String profileImageUrl;
  final int followers;
  final int following;
  final String website;
  final String memberSince;
  final int channelViews;
  final int likes;
  final int modelsCreated;

  UserProfileDTO({
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

  factory UserProfileDTO.fromJson(Map<String, dynamic> json) {
    return UserProfileDTO(
      name: json['name'] ?? '',
      location: json['location'] ?? '',
      description: json['description'] ?? '',
      profileImageUrl: json['profileImageUrl'] ?? '',
      followers: json['followers'] ?? 0,
      following: json['following'] ?? 0,
      website: json['website'] ?? '',
      memberSince: json['memberSince'] ?? '',
      channelViews: json['channelViews'] ?? 0,
      likes: json['likes'] ?? 0,
      modelsCreated: json['modelsCreated'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'location': location,
      'description': description,
      'profileImageUrl': profileImageUrl,
      'followers': followers,
      'following': following,
      'website': website,
      'memberSince': memberSince,
      'channelViews': channelViews,
      'likes': likes,
      'modelsCreated': modelsCreated,
    };
  }
}
