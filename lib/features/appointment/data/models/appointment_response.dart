import 'package:completed_flutter_projects/features/appointment/data/models/appointment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment_response.g.dart';

@JsonSerializable()
class AppointmentsResponse {
  int code;
  String message;
  List<Appointment> data;

  AppointmentsResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory AppointmentsResponse.fromJson(Map<String, dynamic> json) =>
      _$AppointmentsResponseFromJson(json);
}



