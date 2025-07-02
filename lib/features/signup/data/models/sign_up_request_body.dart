// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_body.g.dart';

enum Gender { male, female }

@JsonSerializable()
class SignUpRequestBody {
  @JsonKey(name: 'username')
  String name;
  String email;
  String phone;
  Gender gender;
  String password;
  @JsonKey(name: 'PasswordConfirmation')
  String passwordConfirmation;

  SignUpRequestBody({
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.password,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);
}
