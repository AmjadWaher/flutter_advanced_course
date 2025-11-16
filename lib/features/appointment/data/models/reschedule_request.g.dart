// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reschedule_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RescheduleRequest _$RescheduleRequestFromJson(Map<String, dynamic> json) =>
    RescheduleRequest(
      id: (json['id'] as num).toInt(),
      time: json['time'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$RescheduleRequestToJson(RescheduleRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'time': instance.time,
      'date': instance.date.toIso8601String(),
    };
