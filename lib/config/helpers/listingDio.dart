import 'package:dio/dio.dart';

class PostListingApiService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> getPostListingData(int postListingId) async {
    try {
      final response = await _dio.get('http://192.168.0.121:5000/post_listing/$postListingId');
      return response.data;
    } catch (error) {
      throw Exception('Failed to get user profile data');
    }
  }

}
