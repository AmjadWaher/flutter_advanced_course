import 'package:completed_flutter_projects/core/networking/api_result.dart'
    as api_result;
import 'package:completed_flutter_projects/features/appointment/data/models/appointment.dart';
import 'package:completed_flutter_projects/features/appointment/data/models/reschedule_request.dart';
import 'package:completed_flutter_projects/features/appointment/data/repository/appointment_repository.dart';
import 'package:completed_flutter_projects/features/appointment/logic/cubit/appointment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<Appointment> upcoming = [];
List<Appointment> completed = [];
List<Appointment> cancelled = [];

class AppointmentCubit extends Cubit<AppointmentState> {
  final AppointmentRepository _myAppointmentRepository;
  AppointmentCubit(this._myAppointmentRepository)
    : super(AppointmentState.initial());

  void emitAppointmentStates() async {
    emit(AppointmentState.loading());
    final response = await _myAppointmentRepository.getAppointmentByPatientId();

    switch (response) {
      case api_result.Success(:final data):
        upcoming =
            data.data
                .where((a) => a.status == AppointmentStatus.Pending)
                .toList();
        completed =
            data.data
                .where((a) => a.status == AppointmentStatus.Completed)
                .toList();
        cancelled =
            data.data
                .where((a) => a.status == AppointmentStatus.Cancelled)
                .toList();

        emit(
          AppointmentState.success(
            AppointmentStatusData(
              upcoming: upcoming,
              completed: completed,
              cancelled: cancelled,
            ),
          ),
        );
        break;

      case api_result.Failure(:final error):
        emit(AppointmentState.failure(error.apiErrorModel.message ?? ''));
        break;
    }
  }

  void emitCancelAppointment(Appointment appointment) async {
    emit(AppointmentState.loading());
    final response = await _myAppointmentRepository.cancelAppointment(
      appointment.id,
    );
    switch (response) {
      case api_result.Success(:final data):
        upcoming.remove(appointment);
        cancelled.add(data.data);
        emit(
          AppointmentState.success(
            AppointmentStatusData(
              upcoming: upcoming,
              completed: completed,
              cancelled: cancelled,
            ),
          ),
        );
        break;

      case api_result.Failure(:final error):
        emit(AppointmentState.failure(error.apiErrorModel.message ?? ''));
        break;
    }
  }

  void emitRescheduleAppointment(RescheduleRequest request) async {
    emit(AppointmentState.loading());
    final response = await _myAppointmentRepository.rescheduleAppointment(
      request,
    );

    final appointment = upcoming.where((a) => a.id == request.id).first;
    switch (response) {
      case api_result.Success(:final data):
        upcoming.remove(appointment);
        upcoming.add(data.data);
        emit(
          AppointmentState.success(
            AppointmentStatusData(
              upcoming: upcoming,
              completed: completed,
              cancelled: cancelled,
            ),
          ),
        );
        break;

      case api_result.Failure(:final error):
        emit(AppointmentState.failure(error.apiErrorModel.message ?? ''));
        break;
    }
  }
}
