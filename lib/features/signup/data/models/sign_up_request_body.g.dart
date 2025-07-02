// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequestBody _$SignUpRequestBodyFromJson(Map<String, dynamic> json) =>
    SignUpRequestBody(
      name: json['username'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      password: json['password'] as String,
      passwordConfirmation: json['PasswordConfirmation'] as String,
    );

Map<String, dynamic> _$SignUpRequestBodyToJson(SignUpRequestBody instance) =>
    <String, dynamic>{
      'username': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'gender': _$GenderEnumMap[instance.gender]!,
      'password': instance.password,
      'PasswordConfirmation': instance.passwordConfirmation,
    };

const _$GenderEnumMap = {Gender.male: 'Male', Gender.female: 'Female'};
