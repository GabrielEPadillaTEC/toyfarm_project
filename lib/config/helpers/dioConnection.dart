
 class DioConnection {
  static const String baseApiUrl = 'http://10.1.12.138:5000/';

  static String getApiUrl(String apiRoute) {
   return baseApiUrl + apiRoute;
  }
 }