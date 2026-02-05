// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_response.g.dart';

@JsonSerializable(createToJson: false)
class ProfileResponse {
  int code;
  String message;
  UserData data;
  ProfileResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class UserData {
  String userName;
  String phoneNumber;
  String photo;
  UserData({
    required this.userName,
    required this.phoneNumber,
    required this.photo,
  });

  factory UserData.fromJson(Map<String, String> json) =>
      _$UserDataFromJson(json);
}
