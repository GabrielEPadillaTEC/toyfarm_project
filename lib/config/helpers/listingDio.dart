import 'package:dio/dio.dart';
import 'package:toyfarn_project/config/helpers/dioConnection.dart';
class PostListingApiService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> getPostListingData(int postListingId) async {
    try {
      final response = await _dio.get(DioConnection.getApiUrl('post_listing/$postListingId'));
      return response.data;
    } catch (error) {
      throw Exception('Failed to get user profile data');
    }
  }

}
