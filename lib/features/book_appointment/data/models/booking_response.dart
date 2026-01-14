// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_response.g.dart';

@JsonSerializable()
class BookingResponse {
  int code;
  String  message;
  BookingResult data;

  BookingResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory BookingResponse.fromJson(Map<String, dynamic> json) => _$BookingResponseFromJson(json);
}

@JsonSerializable()
class BookingResult {
  int appointmentId;
  double amount;
  BookingResult({
    required this.appointmentId,
    required this.amount,
  });

  factory BookingResult.fromJson(Map<String, dynamic> json) => _$BookingResultFromJson(json);
}
