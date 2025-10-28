// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentsResponse _$AppointmentsResponseFromJson(
  Map<String, dynamic> json,
) => AppointmentsResponse(
  code: (json['code'] as num).toInt(),
  message: json['message'] as String,
  data:
      (json['data'] as List<dynamic>)
          .map((e) => Appointment.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$AppointmentsResponseToJson(
  AppointmentsResponse instance,
) => <String, dynamic>{
  'code': instance.code,
  'message': instance.message,
  'data': instance.data,
};
