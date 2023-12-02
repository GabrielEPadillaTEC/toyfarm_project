import 'package:dio/dio.dart';

class UserProfileApiService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> getUserProfileData(int userId) async {
    try {
      final response = await _dio.get('http://192.168.0.121:5000/user_profile/$userId');
      return response.data;
    } catch (error) {
      throw Exception('Failed to get user profile data');
    }
  }
}
