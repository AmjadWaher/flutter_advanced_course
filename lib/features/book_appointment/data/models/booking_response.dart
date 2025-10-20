
import 'package:freezed_annotation/freezed_annotation.dart';
part 'booking_response.g.dart';

@JsonSerializable()
class BookingResponse {
  int code;
  String  message;

  BookingResponse({
    required this.code,
    required this.message,
  });

  factory BookingResponse.fromJson(Map<String, dynamic> json) => _$BookingResponseFromJson(json);
}