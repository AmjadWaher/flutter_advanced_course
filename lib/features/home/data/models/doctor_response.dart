// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:completed_flutter_projects/features/home/data/models/doctor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'doctor_response.g.dart';


@JsonSerializable()
class DoctorResponse {
  int code;
  String message;
  List<Doctor> data;
  DoctorResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory DoctorResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorResponseFromJson(json);
}