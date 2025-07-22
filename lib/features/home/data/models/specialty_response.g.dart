// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialty_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecialtyResponse _$SpecialtyResponseFromJson(Map<String, dynamic> json) =>
    SpecialtyResponse(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      data:
          (json['data'] as List<dynamic>)
              .map((e) => Specialty.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$SpecialtyResponseToJson(SpecialtyResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Specialty _$SpecialtyFromJson(Map<String, dynamic> json) => Specialty(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  image: json['image'] as String,
  doctors:
      (json['doctors'] as List<dynamic>?)
          ?.map((e) => Doctor.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$SpecialtyToJson(Specialty instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
  'doctors': instance.doctors,
};
