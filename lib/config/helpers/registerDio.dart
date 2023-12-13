import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:toyfarn_project/config/helpers/dioConnection.dart';

import '../../model/dtos/user_profile_dto.dart';
Dio dio = Dio();
  void updateProfile(String profileId, Map<String, dynamic> newProfileData) async {

    final String apiUrl = DioConnection.getApiUrl('/update_user_profile/$profileId');

    try {
      Response response = await dio.post(
        apiUrl,
        data: newProfileData,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      print('Response: ${response.data}');
      // Handle the response as needed
    } catch (error) {
      print('Error: $error');
      // Handle the error
    }

}
Future<bool> createProfile(String profileId, UserProfileDTO userProfile) async {

  final String apiUrl = DioConnection.getApiUrl('new_user_profile/$profileId');

  try {
    Response response = await dio.post(
      apiUrl,
      data: jsonEncode(userProfile.toJson()),
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );

    if (response.statusCode == 200) {
      print('Profile created successfully');
      return true;
    } else {
      print('Failed to create profile. Status Code: ${response.statusCode}');
      return false;
    }
  } catch (error) {
    print('Error: $error');
    return false;
  }
}
