import 'package:flutter/material.dart';
import 'package:toyfarn_project/domain/entities/listing.dart'; // Import your UserProfile class
import 'package:toyfarn_project/model/dtos/listing_dto.dart'; // Import your UserProfileDTO class
import 'package:toyfarn_project/infrastructure/mappers/listing_mapper.dart'; // Import your UserProfileMapper class
import 'package:toyfarn_project/config/helpers/listingDio.dart'; // Import your UserProfileApiService class

class PostListingViewModel {
  final PostListingApiService _apiService = PostListingApiService();

  late PostListingDetails _listingDetails;

  PostListingDetails get listingDetails => _listingDetails;

  Future<void> fetchUserProfile(int id) async {
    try {
      final apiResponse = await _apiService.getPostListingData(id);
      final postListingDTO = PostListingMapper.mapApiResponseToDTO(apiResponse);
      _listingDetails = PostListingMapper.postListingDTOToEntity(postListingDTO);
    } catch (error) {
      // Handle error, e.g., show an error message
      print('Error fetching user profile: $error');
    }
  }
}
