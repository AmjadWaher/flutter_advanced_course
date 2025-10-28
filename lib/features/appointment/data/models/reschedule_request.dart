import 'package:completed_flutter_projects/features/appointment/data/models/appointment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reschedule_request.g.dart';

@JsonSerializable()
class RescheduleRequest {
  int id;
  String time;
  Appointment date;

  RescheduleRequest({required this.id, required this.time, required this.date});

  Map<String, dynamic> toJson() => _$RescheduleRequestToJson(this);
}
