import 'package:dio/dio.dart';

class UserProfileApiService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> getUserProfileData(int userId) async {
    try {
      final response = await _dio.get('http://127.0.0.1:5000/user_profile/$userId');
      return response.data;
    } catch (error) {
      throw Exception('Failed to get user profile data');
    }
  }
}
