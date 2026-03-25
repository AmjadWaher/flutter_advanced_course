// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_card_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteCardResponse _$DeleteCardResponseFromJson(Map<String, dynamic> json) =>
    DeleteCardResponse(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$DeleteCardResponseToJson(DeleteCardResponse instance) =>
    <String, dynamic>{'code': instance.code, 'message': instance.message};
