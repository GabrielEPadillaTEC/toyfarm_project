import 'package:dio/dio.dart';
import 'package:toyfarn_project/domain/entities/offer.dart';
import 'package:toyfarn_project/infrastructure/mappers/offer_mapper.dart';

class OfferApiService {
  final Dio _dio = Dio();

  late List<OfferEntity> _offersList;

  List<OfferEntity> get offerList => _offersList;

  Future<void> getOffers(int postListingId) async {
    try {
      final response = await _dio.get('http://192.168.0.121:5000/post_listing_offers/$postListingId');
      final apiResponse = response.data;
      _offersList = OfferMapper.mapApiResponseToEntity(apiResponse);
    } catch (error) {
      throw Exception('Failed to get post listing offer data');
    }
  }
}
