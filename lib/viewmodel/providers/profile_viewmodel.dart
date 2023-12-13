import 'package:flutter/material.dart';
import 'package:toyfarn_project/domain/entities/user_profile.dart'; // Import your UserProfile class
import 'package:toyfarn_project/model/dtos/user_profile_dto.dart'; // Import your UserProfileDTO class
import 'package:toyfarn_project/infrastructure/mappers/user_profile_mapper.dart'; // Import your UserProfileMapper class
import 'package:toyfarn_project/config/helpers/user_profileDio.dart'; // Import your UserProfileApiService class

class ProfileViewModel {
  final UserProfileApiService _apiService = UserProfileApiService();

  late UserProfile _userProfile;

  UserProfile get userProfile => _userProfile;

  Future<void> fetchUserProfile(String userId) async {
    try {
      final apiResponse = await _apiService.getUserProfileData(userId);
      final userProfileDTO = UserProfileMapper.mapApiResponseToDTO(apiResponse);
      _userProfile = UserProfileMapper.userProfileDTOToEntity(userProfileDTO);
    } catch (error) {
      // Handle error, e.g., show an error message
      print('Error fetching user profile: $error');
    }
  }
}
