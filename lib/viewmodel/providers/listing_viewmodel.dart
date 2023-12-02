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
      print("apiResponse");
      print(apiResponse);
      final postListingDTO = PostListingMapper.mapApiResponseToDTO(apiResponse);
      print("postListingDTO");
      print(postListingDTO);
      _listingDetails = PostListingMapper.postListingDTOToEntity(postListingDTO);
      print("_listingDetails");
      print(_listingDetails);
    } catch (error) {
      // Handle error, e.g., show an error message
      print('Error fetching user profile: $error');
    }
  }
}
