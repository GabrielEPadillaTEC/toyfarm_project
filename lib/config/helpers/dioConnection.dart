
 class DioConnection {
  static const String baseApiUrl = 'http://192.168.0.121:5000/';

  static String getApiUrl(String apiRoute) {
   return baseApiUrl + apiRoute;
  }
 }