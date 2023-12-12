import 'package:dio/dio.dart';
import 'package:toyfarn_project/config/helpers/dioConnection.dart';
class UserApiService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> getListingsList(int userId) async {
    try {
      final response = await _dio.get(DioConnection.getApiUrl('user_listings/$userId'));
      return response.data;
    } catch (error) {
      throw Exception('Failed to you listings list');
    }
  }
  Future<Map<String, dynamic>> getOffersList(int userId) async {
    try {
      final response = await _dio.get(DioConnection.getApiUrl('user_offers/$userId'));
      return response.data;
    } catch (error) {
      throw Exception('Failed to get offers list');
    }
  }
  Future<Map<String, dynamic>> getRatingsList(int userId) async {
    try {
      final response = await _dio.get(DioConnection.getApiUrl('user_ratings/$userId'));
      return response.data;
    } catch (error) {
      throw Exception('Failed to get ratings list');
    }
  }

}
