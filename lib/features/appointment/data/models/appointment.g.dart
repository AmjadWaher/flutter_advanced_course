// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
  id: (json['id'] as num).toInt(),
  time: DateTime.parse(json['time'] as String),
  date: DateTime.parse(json['date'] as String),
  paymentMethod: json['paymentMethod'] as String,
  status: $enumDecode(_$AppointmentStatusEnumMap, json['status']),
  doctor: Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'time': instance.time.toIso8601String(),
      'date': instance.date.toIso8601String(),
      'paymentMethod': instance.paymentMethod,
      'status': _$AppointmentStatusEnumMap[instance.status]!,
      'doctor': instance.doctor,
    };

const _$AppointmentStatusEnumMap = {
  AppointmentStatus.Pending: 'Pending',
  AppointmentStatus.Completed: 'Completed',
  AppointmentStatus.Cancelled: 'Cancelled',
};
