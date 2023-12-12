import 'package:dio/dio.dart';
import 'package:toyfarn_project/config/helpers/dioConnection.dart';
class CatalogApiService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> getListingList() async {
    try {
      final response = await _dio.get(DioConnection.getApiUrl('listings'));
      return response.data;
    } catch (error) {
      throw Exception('Failed to get listings list');
    }
  }
  Future<Map<String, dynamic>> getServiceList() async {
    try {
      final response = await _dio.get(DioConnection.getApiUrl('services'));
      return response.data;
    } catch (error) {
      throw Exception('Failed to get services list');
    }
  }
  Future<Map<String, dynamic>> getModelList() async {
    try {
      final response = await _dio.get(DioConnection.getApiUrl('models'));
      return response.data;
    } catch (error) {
      throw Exception('Failed to get models list');
    }
  }

}
