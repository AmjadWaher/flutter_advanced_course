// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';
part 'pay_cash_response.g.dart';

@JsonSerializable(createToJson: false)
class PayCashResponse {
  int code;
  String message;
  PayCashResponse({required this.code, required this.message});

  factory PayCashResponse.fromJson(Map<String, dynamic> json) =>
      _$PayCashResponseFromJson(json);
}
