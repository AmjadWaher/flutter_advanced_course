import 'package:completed_flutter_projects/features/home/data/models/doctor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'appointment.g.dart';

enum AppointmentStatus { Pending, Completed, Cancelled }

@JsonSerializable()
class Appointment {
  int id;
  DateTime time;
  DateTime date;
  String paymentMethod;
  AppointmentStatus status;
  Doctor doctor;

  Appointment({
    required this.id,
    required this.time,
    required this.date,
    required this.paymentMethod,
    required this.status,
    required this.doctor,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);
}
