class OfferDTO {
  final int id;
  final String userProfileId;
  final String date; // String representation of DateTime in ISO 8601 format
  final int postListingId;
  final double offerValue;

  OfferDTO({
    required this.id,
    required this.userProfileId,
    required this.date,
    required this.postListingId,
    required this.offerValue,
  });

  // Factory method to create OfferDTO from JSON
  factory OfferDTO.fromJson(Map<String, dynamic> json) {
    return OfferDTO(
      id: json['id'] ?? 0,
      userProfileId: json['userProfileId'] ?? '',
      date: json['date'] ?? '',
      postListingId: json['postListingId'] ?? 0,
      offerValue: (json['offerValue'] ?? 0.0).toDouble(),
    );
  }
}