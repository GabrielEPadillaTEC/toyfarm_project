class ModelCatalogDTO {
  final String name;
  final String cost;

  ModelCatalogDTO({
    required this.name,
    required this.cost
  });


  factory ModelCatalogDTO.fromJson(Map<String, dynamic> json) {
    return ModelCatalogDTO(
        name: json['name'] ?? '',
        cost: json['cost'] ?? ''
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'cost': cost
    };
  }
}
