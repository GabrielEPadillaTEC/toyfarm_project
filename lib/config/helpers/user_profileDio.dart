import 'package:dio/dio.dart';
import 'package:toyfarn_project/config/helpers/dioConnection.dart';
class UserProfileApiService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> getUserProfileData(String userId) async {
    try {
      final response = await _dio.get(DioConnection.getApiUrl('user_profile/$userId'));
      return response.data;
    } catch (error) {
      throw Exception('Failed to get user profile data');
    }
  }
}
