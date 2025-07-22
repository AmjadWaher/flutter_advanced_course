// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
  id: json['id'] as String,
  username: json['userName'] as String,
  email: json['email'] as String,
  phoneNumber: json['phoneNumber'] as String,
  gender: json['gender'] as String,
  photo: json['photo'] as String,
  description: json['description'] as String,
  degree: json['degree'] as String,
  specialization: DoctorSpecialty.fromJson(
    json['specialization'] as Map<String, dynamic>,
  ),
  clinic: Clinic.fromJson(json['clinic'] as Map<String, dynamic>),
  appointPrice: (json['appointPrice'] as num).toDouble(),
  startTime: Doctor._formatTime(json['startTime'] as String),
  endTime: Doctor._formatTime(json['endTime'] as String),
);

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
  'id': instance.id,
  'userName': instance.username,
  'email': instance.email,
  'phoneNumber': instance.phoneNumber,
  'gender': instance.gender,
  'photo': instance.photo,
  'description': instance.description,
  'degree': instance.degree,
  'specialization': instance.specialization,
  'clinic': instance.clinic,
  'appointPrice': instance.appointPrice,
  'startTime': instance.startTime,
  'endTime': instance.endTime,
};

DoctorSpecialty _$DoctorSpecialtyFromJson(Map<String, dynamic> json) =>
    DoctorSpecialty(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$DoctorSpecialtyToJson(DoctorSpecialty instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
