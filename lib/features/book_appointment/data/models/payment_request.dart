import 'package:json_annotation/json_annotation.dart';
part 'payment_request.g.dart';

@JsonSerializable()
class PaymentRequest {
  int appointmentId;
  String paymentMethodId;

  PaymentRequest({required this.appointmentId, required this.paymentMethodId});

  Map<String, dynamic> toJson() => _$PaymentRequestToJson(this);
}
