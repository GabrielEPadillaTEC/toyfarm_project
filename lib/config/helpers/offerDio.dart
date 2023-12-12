import 'package:dio/dio.dart';
import 'package:toyfarn_project/domain/entities/offer.dart';
import 'package:toyfarn_project/infrastructure/mappers/offer_mapper.dart';
import 'package:toyfarn_project/config/helpers/dioConnection.dart';
class OfferApiService {
  final Dio _dio = Dio();

  late List<OfferEntity> _offersList;

  List<OfferEntity> get offerList => _offersList;

  Future<void> getOffers(int postListingId) async {
    try {
      final response = await _dio.get(DioConnection.getApiUrl('post_listing_offers/$postListingId'));
      final apiResponse = response.data;
      _offersList = OfferMapper.mapApiResponseToEntity(apiResponse);
    } catch (error) {
      throw Exception('Failed to get post listing offer data');
    }
  }
}
