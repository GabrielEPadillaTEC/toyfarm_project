import 'package:dio/dio.dart';

import '../../config/helpers/dioConnection.dart';

class ModelCatalogDTO {
  final String name;
  final String cost;
  final int id;

  ModelCatalogDTO({
    required this.name,
    required this.cost,
    required this.id,
  });
}

Future<List<ModelCatalogDTO>> fetchAllListings() async {
  final Dio _dio = Dio();
  try {
    final response = await _dio.get(DioConnection.getApiUrl('all_listings'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = response.data;
      return jsonList.map((json) => ModelCatalogDTO(
        name: json['name'] ?? '',
        cost: json['cost'] ?? '',
        id: json['id'] ?? 0,
      )).toList();
    } else {
      throw Exception('Failed to load listings');
    }
  } catch (error) {
    print('Error fetching listings: $error');
    throw Exception('Failed to load listings');
  }
}