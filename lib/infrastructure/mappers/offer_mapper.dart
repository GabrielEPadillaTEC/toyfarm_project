import 'dart:convert';

import 'package:toyfarn_project/domain/entities/offer.dart';
import 'package:toyfarn_project/model/dtos/offer_dto.dart';

class OfferMapper {
  static OfferEntity mapDtoToEntity(OfferDTO dto) {
    return OfferEntity(
      id: dto.id,
      userProfileId: dto.userProfileId,
      date: DateTime.parse(dto.date),
      postListingId: dto.postListingId,
      offerValue: dto.offerValue,
    );
  }

  static OfferDTO mapEntityToDto(OfferEntity entity) {
    return OfferDTO(
      id: entity.id,
      userProfileId: entity.userProfileId,
      date: entity.date.toIso8601String(),
      postListingId: entity.postListingId,
      offerValue: entity.offerValue,
    );
  }

  static List<OfferEntity> mapApiResponseToEntity(dynamic offerData) {
    if (offerData is List && offerData.isNotEmpty) {
      return offerData.map((data) => _mapOffer(data)).toList();
    } else {
      return [];
    }
  }

  static OfferEntity _mapOffer(Map<String, dynamic> data) {
    return OfferEntity(
      id: data['id'] as int,
      userProfileId: data['userProfileId'] as int,
      date: _parseDate(data['date'] as String),
      postListingId: data['postListingId'] as int,
      offerValue: data['offerValue'] as double,
    );
  }

  static DateTime _parseDate(String dateString) {
    return DateTime.tryParse(dateString) ?? DateTime.now();
  }

}