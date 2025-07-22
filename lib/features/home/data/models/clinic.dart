import 'package:json_annotation/json_annotation.dart';

part 'clinic.g.dart';

@JsonSerializable()
class Clinic {
  int id;
  String name;
  String phone;
  String address;
  Clinic({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
  });

  factory Clinic.fromJson(Map<String,dynamic> json) => _$ClinicFromJson(json);
}
