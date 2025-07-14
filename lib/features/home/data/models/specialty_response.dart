// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:completed_flutter_projects/features/home/data/models/doctor.dart';

part 'specialty_response.g.dart';


@JsonSerializable()
class SpecialtyResponse {
  int code;
  String message;
  List<Specialty> data;
  SpecialtyResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory SpecialtyResponse.fromJson(Map<String, dynamic> json) =>
      _$SpecialtyResponseFromJson(json);
}

@JsonSerializable()
class Specialty {
  int id;
  String name;
  String image;
  @JsonKey(defaultValue: [])
  List<Doctor> doctors;
  Specialty({
    required this.id,
    required this.name,
    required this.image,
    required this.doctors,
  });

  factory Specialty.fromJson(Map<String, dynamic> json) =>
      _$SpecialtyFromJson(json);
}
