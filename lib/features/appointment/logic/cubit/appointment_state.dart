import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:completed_flutter_projects/features/appointment/data/models/appointment.dart';

part 'appointment_state.freezed.dart';

@freezed
class AppointmentState<T> with _$AppointmentState {
  const factory AppointmentState.initial() = _Initial;
  const factory AppointmentState.loading() = Loading;
  const factory AppointmentState.success(T data) = Success<T>;
  const factory AppointmentState.failure(String error) = Failure;
}

class AppointmentStatusData {
  final List<Appointment> upcoming;
  final List<Appointment> completed;
  final List<Appointment> cancelled;

  AppointmentStatusData({
    required this.upcoming,
    required this.completed,
    required this.cancelled,
  });
}
