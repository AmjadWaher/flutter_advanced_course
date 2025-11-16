import 'package:json_annotation/json_annotation.dart';

part 'appointment.g.dart';

enum AppointmentStatus { Pending, Completed, Cancelled }

@JsonSerializable()
class Appointment {
  int id;
  String time;
  DateTime date;
  AppointmentStatus status;
  String doctorName;
  String doctorImageUrl;
  String doctorSpecialty;
  String doctorClinic;
  String doctorPhone;
  String doctorStartTime;
  String doctorEndTime;

  Appointment({
    required this.id,
    required this.time,
    required this.date,
    required this.status,
    required this.doctorName,
    required this.doctorImageUrl,
    required this.doctorSpecialty,
    required this.doctorClinic,
    required this.doctorPhone,
    required this.doctorStartTime,
    required this.doctorEndTime,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);
}