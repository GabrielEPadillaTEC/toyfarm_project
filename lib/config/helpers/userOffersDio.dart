import 'package:dio/dio.dart';
import 'package:toyfarn_project/domain/entities/entities.dart';
import 'package:toyfarn_project/domain/entities/offer.dart';
import 'package:toyfarn_project/infrastructure/mappers/offer_mapper.dart';
import 'package:toyfarn_project/infrastructure/mappers/listing_mapper.dart';
import 'package:toyfarn_project/config/helpers/dioConnection.dart';
class UserListerApiService {
  final Dio _dio = Dio();

  late List<OfferEntity> _offersList;

  List<OfferEntity> get offerList => _offersList;

  late List<PostListingDetails> _listingsList;

  List<PostListingDetails> get listingsList => _listingsList;
  late bool exists;

  Future<void> getUserOffersListings(String userUID,String option) async {
    print(option);
    if(option=='listings') {
      try {
        final response = await _dio.get(
            DioConnection.getApiUrl('user_listings/$userUID'));
        final apiResponse = response.data;
        _listingsList = PostListingMapper.mapApiResponseToEntity(apiResponse);
        exists=true;
      } catch (error) {
        exists=false;
        print('Error fetching user profile: $error');

      }
    }else if(option=='offers') {
      try {
        final response = await _dio.get(
            DioConnection.getApiUrl('user_offers/$userUID'));
        final apiResponse = response.data;
        _offersList = OfferMapper.mapApiResponseToEntity(apiResponse);
        exists=true;
      } catch (error) {
        exists=false;
        print('Error fetching user profile: $error');
      }
    }else{
      exists=false;
    }
  }
}
