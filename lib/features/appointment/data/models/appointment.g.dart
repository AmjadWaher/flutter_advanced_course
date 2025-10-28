// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
  id: (json['id'] as num).toInt(),
  time: DateTime.parse(json['time'] as String),
  date: DateTime.parse(json['date'] as String),
  status: $enumDecode(_$AppointmentStatusEnumMap, json['status']),
  doctorName: json['doctorName'] as String,
  doctorImageUrl: json['doctorImageUrl'] as String,
  doctorSpecialty: json['doctorSpecialty'] as String,
  doctorClinic: json['doctorClinic'] as String,
  doctorPhone: json['doctorPhone'] as String,
  doctorStartTime: json['doctorStartTime'] as String,
  doctorEndTime: json['doctorEndTime'] as String,
);

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'time': instance.time.toIso8601String(),
      'date': instance.date.toIso8601String(),
      'status': _$AppointmentStatusEnumMap[instance.status]!,
      'doctorName': instance.doctorName,
      'doctorImageUrl': instance.doctorImageUrl,
      'doctorSpecialty': instance.doctorSpecialty,
      'doctorClinic': instance.doctorClinic,
      'doctorPhone': instance.doctorPhone,
      'doctorStartTime': instance.doctorStartTime,
      'doctorEndTime': instance.doctorEndTime,
    };

const _$AppointmentStatusEnumMap = {
  AppointmentStatus.Pending: 'Pending',
  AppointmentStatus.Completed: 'Completed',
  AppointmentStatus.Cancelled: 'Cancelled',
};
