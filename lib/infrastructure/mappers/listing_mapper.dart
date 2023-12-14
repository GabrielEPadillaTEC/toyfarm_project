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
      vendorId: postListingDTO.vendorId,
      vendorDetails: postListingDTO.vendorDetails,
      images: postListingDTO.images
    );
  }
  static PostListingDTO mapApiResponseToDTO(Map<String, dynamic> apiResponse) {
    return PostListingDTO(
      id: apiResponse['id'] ?? 0,
      title: apiResponse['title'] ?? '',
      price:  apiResponse['price'] ?? '',
      description: apiResponse['description'] ?? '',
      vendorName: apiResponse['vendorName'] ?? '',
      vendorId: apiResponse['vendorId'] ?? '',
      vendorDetails: apiResponse['vendorDetails'] ?? '',
      images: (apiResponse['images'] as List<dynamic>?)?.cast<String>() ?? []
    );
  }
  static List<PostListingDetails> mapApiResponseToEntity(dynamic offerData) {
    if (offerData is List && offerData.isNotEmpty) {
      print('1111');
      return offerData.map((data) => _mapOffer(data)).toList();
    } else {
      return [];
    }
  }

  static PostListingDetails _mapOffer(Map<String, dynamic> data) {
    return PostListingDetails(

      id: data['id'] as int,
      title: data['title'] as String,
      price:  data['price'] as String,
      description: data['description'] as String,
      vendorName: data['vendorName'] as String,
      vendorId: data['vendorId'] as String,
      vendorDetails: data['vendorDetails'] as String,
      images: (data['images'] as List<dynamic>).cast<String>(),
    );


  }
}
