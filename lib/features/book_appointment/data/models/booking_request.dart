import 'package:json_annotation/json_annotation.dart';
part 'booking_request.g.dart';

@JsonSerializable()
class BookingRequest {
  String doctorId;
  String time;
  String date;
  double price;
  String paymentMethod;

  BookingRequest({
    required this.doctorId,
    required this.time,
    required this.date,
    required this.price,
    required this.paymentMethod,
  });

  Map<String, dynamic> toJson() => _$BookingRequestToJson(this);
}
