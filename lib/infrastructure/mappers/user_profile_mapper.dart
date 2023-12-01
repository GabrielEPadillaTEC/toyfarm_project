import 'package:toyfarn_project/domain/entities/entities.dart';
import 'package:toyfarn_project/model/models.dart';

class UserProfileMapper {
  static UserProfile userProfileDTOToEntity(UserProfileDTO userProfileDTO) {
    return UserProfile(
      name: userProfileDTO.name,
      location: userProfileDTO.location,
      description: userProfileDTO.description,
      profileImageUrl: userProfileDTO.profileImageUrl,
      followers: userProfileDTO.followers,
      following: userProfileDTO.following,
      website: userProfileDTO.website,
      memberSince: userProfileDTO.memberSince,
      channelViews: userProfileDTO.channelViews,
      likes: userProfileDTO.likes,
      modelsCreated: userProfileDTO.modelsCreated,
    );
  }
  static UserProfileDTO mapApiResponseToDTO(Map<String, dynamic> apiResponse) {
    return UserProfileDTO(
      name: apiResponse['name'] ?? '',
      location: apiResponse['location'] ?? '',
      description: apiResponse['description'] ?? '',
      profileImageUrl: apiResponse['profileImageUrl'] ?? '',
      followers: apiResponse['followers'] ?? 0,
      following: apiResponse['following'] ?? 0,
      website: apiResponse['website'] ?? '',
      memberSince: apiResponse['memberSince'] ?? '',
      channelViews: apiResponse['channelViews'] ?? 0,
      likes: apiResponse['likes'] ?? 0,
      modelsCreated: apiResponse['modelsCreated'] ?? 0,
    );
  }
}
