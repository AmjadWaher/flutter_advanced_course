// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:completed_flutter_projects/features/home/data/models/clinic.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'doctor.g.dart';

@JsonSerializable()
class Doctor {
  String id;
  @JsonKey(name: "userName")
  String username;
  String email;
  String phoneNumber;
  String gender;
  String photo;
  String description;
  String degree;
  DoctorSpecialty specialization;
  Clinic clinic;
  double appointPrice;
  @JsonKey(fromJson: _formatTime)
  String startTime;
  @JsonKey(fromJson: _formatTime)
  String endTime;

  Doctor({
    required this.id,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.photo,
    required this.description,
    required this.degree,
    required this.specialization,
    required this.clinic,
    required this.appointPrice,
    required this.startTime,
    required this.endTime,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

  static String _formatTime(String time) {
    try {
      final dt = DateFormat("HH:mm:ss").parse(time);
      return DateFormat("hh:mm a").format(dt);
    } catch (_) {
      return time;
    }
  }
}

@JsonSerializable()
class DoctorSpecialty {
  int id;
  String name;
  DoctorSpecialty({
    required this.id,
    required this.name,
  });

  factory DoctorSpecialty.fromJson(Map<String, dynamic> json) =>
      _$DoctorSpecialtyFromJson(json);
}
