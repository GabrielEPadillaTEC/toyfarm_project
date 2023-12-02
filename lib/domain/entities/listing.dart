import 'package:toyfarn_project/domain/entities/offer.dart';

class PostListingDetails {
  final int id;
  final String title;
  final String price;
  final String description;
  final String vendorName;
  final String vendorDetails;
  final List<OfferEntity> offers;

  PostListingDetails({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.vendorName,
    required this.vendorDetails,
    this.offers = const [],  // Default to an empty list if not provided
  });
}