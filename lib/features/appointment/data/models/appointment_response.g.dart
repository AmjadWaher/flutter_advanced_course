// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentResponse _$AppointmentResponseFromJson(Map<String, dynamic> json) =>
    AppointmentResponse(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      data: Appointment.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppointmentResponseToJson(
  AppointmentResponse instance,
) => <String, dynamic>{
  'code': instance.code,
  'message': instance.message,
  'data': instance.data,
};
