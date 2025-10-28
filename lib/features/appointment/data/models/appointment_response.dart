import 'package:completed_flutter_projects/features/appointment/data/models/appointment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'appointment_response.g.dart';

@JsonSerializable()
class AppointmentResponse {
  int code;
  String message;
  Appointment data;

  AppointmentResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory AppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$AppointmentResponseFromJson(json);
}
