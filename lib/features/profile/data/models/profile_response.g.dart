// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      data: UserData.fromJson(Map<String, String>.from(json['data'] as Map)),
    );

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
  userName: json['userName'] as String,
  phoneNumber: json['phoneNumber'] as String,
  photo: json['photo'] as String,
);
