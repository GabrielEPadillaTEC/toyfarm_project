class PostListingDTO {
  final int id;
  final String title;
  final String price;
  final String description;
  final String vendorName;
  final String vendorDetails;

  PostListingDTO({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.vendorName,
    required this.vendorDetails,
  });

  factory PostListingDTO.fromJson(Map<String, dynamic> json) {
    return PostListingDTO(
      id:  json[''] ?? 0,
      title:   json[''] ?? '',
      price:   json[''] ?? 0.0,
      description:   json[''] ?? '',
      vendorName:   json[''] ?? '',
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
      'vendorDetails': vendorDetails,
    };
  }
}
