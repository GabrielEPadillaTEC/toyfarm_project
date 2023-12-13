class OfferEntity {
  final int id;
  final String userProfileId;
  final DateTime date;
  final int postListingId;
  final double offerValue;

  OfferEntity({
    required this.id,
    required this.userProfileId,
    required this.date,
    required this.postListingId,
    required this.offerValue,
  });
}