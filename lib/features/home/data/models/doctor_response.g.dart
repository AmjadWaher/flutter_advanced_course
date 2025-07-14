// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorResponse _$DoctorResponseFromJson(Map<String, dynamic> json) =>
    DoctorResponse(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      data:
          (json['data'] as List<dynamic>)
              .map((e) => Doctor.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$DoctorResponseToJson(DoctorResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
