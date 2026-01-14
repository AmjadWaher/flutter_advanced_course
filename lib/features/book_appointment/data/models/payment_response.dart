import 'package:json_annotation/json_annotation.dart';
part 'payment_response.g.dart';

@JsonSerializable(createToJson: false)
class PaymentResponse {
  int code;
  String message;
  Map<String,String> data;
  PaymentResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory PaymentResponse.fromJson(Map<String, dynamic> json) => _$PaymentResponseFromJson(json);
}
