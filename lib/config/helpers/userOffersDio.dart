import 'package:dio/dio.dart';
import 'package:toyfarn_project/domain/entities/offer.dart';
import 'package:toyfarn_project/infrastructure/mappers/offer_mapper.dart';
import 'package:toyfarn_project/config/helpers/dioConnection.dart';
class UserListerApiService {
  final Dio _dio = Dio();

  late List<OfferEntity> _offersList;

  List<OfferEntity> get offerList => _offersList;

  late List<OfferEntity> _offersList;

  List<OfferEntity> get offerList => _offersList;

  Future<void> getUserOffersListings(String userUID,int opcion) async {

    if(opcion==1) {
      try {
        final response = await _dio.get(
            DioConnection.getApiUrl('post_users_offers/$userUID'));
        final apiResponse = response.data;
        _offersList = OfferMapper.mapApiResponseToEntity(apiResponse);
      } catch (error) {
        throw Exception('Failed to get post listing offer data');
      }
    }else if(opcion==2) {
      try {
        final response = await _dio.get(
            DioConnection.getApiUrl('post_users_listings/$userUID'));
        final apiResponse = response.data;
        _offersList = OfferMapper.mapApiResponseToEntity(apiResponse);
      } catch (error) {
        throw Exception('Failed to get post listing offer data');
      }
    }
  }
}
