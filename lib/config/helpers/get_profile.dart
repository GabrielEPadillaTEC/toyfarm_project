import 'package:dio/dio.dart';
import '../../../model/dtos/user_profile_dto.dart';

class UserProfileApi {
  final Dio _dio = Dio();

  Future<UserProfileDTO> getUserProfile(int profileId) async {
      final response = await _dio.get('http://your-api-endpoint/user_profile/$profileId');
      return UserProfileDTO.fromJson(response.data);

  }

  Future<void> updateUserProfile(int profileId, UserProfileDTO newProfileData) async {
      await _dio.post('http://your-api-endpoint/user_profile/$profileId', data: newProfileData.toJson());
  }
}
