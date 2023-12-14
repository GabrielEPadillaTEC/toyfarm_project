class PostListingDTO {
  final int id;
  final String title;
  final String price;
  final String description;
  final String vendorName;
  final String vendorId;
  final String vendorDetails;

  PostListingDTO({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.vendorName,
    required this.vendorId,
    required this.vendorDetails,
  });

  factory PostListingDTO.fromJson(Map<String, dynamic> json) {
    return PostListingDTO(
      id:  json[''] ?? 0,
      title:   json[''] ?? '',
      price:   json[''] ?? '',
      description:   json[''] ?? '',
      vendorName:   json[''] ?? '',
      vendorId:   json[''] ?? '',
      vendorDetails:   json[''] ?? '',
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id ,
      'title': title,
      'price': price,
      'description': description,
      'vendorName': vendorName,
      'vendorId': vendorId,
      'vendorDetails': vendorDetails,
    };
  }
}
