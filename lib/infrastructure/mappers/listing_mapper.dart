import 'package:toyfarn_project/domain/entities/entities.dart';
import 'package:toyfarn_project/model/dtos/listing_dto.dart';
import 'package:toyfarn_project/model/models.dart';

class PostListingMapper {
  static PostListingDetails postListingDTOToEntity(PostListingDTO postListingDTO) {
    return PostListingDetails(

      id: postListingDTO.id,
      title: postListingDTO.title,
      price:  postListingDTO.price,
      description: postListingDTO.description,
      vendorName: postListingDTO.vendorName,
      vendorDetails: postListingDTO.vendorDetails,
    );
  }
  static PostListingDTO mapApiResponseToDTO(Map<String, dynamic> apiResponse) {
    return PostListingDTO(
      id: apiResponse['id'] ?? 0,
      title: apiResponse['title'] ?? '',
      price:  apiResponse['price'] ?? '',
      description: apiResponse['description'] ?? '',
      vendorName: apiResponse['vendorName'] ?? '',
      vendorDetails: apiResponse['vendorDetails'] ?? '',
    );
  }
}