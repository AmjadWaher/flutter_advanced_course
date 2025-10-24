import 'package:completed_flutter_projects/core/networking/api_result.dart'
    as api_result;
import 'package:completed_flutter_projects/features/my_appointment/data/models/appointment.dart';
import 'package:completed_flutter_projects/features/my_appointment/data/models/reschedule_request.dart';
import 'package:completed_flutter_projects/features/my_appointment/data/repository/appointment_repository.dart';
import 'package:completed_flutter_projects/features/my_appointment/logic/cubit/appointment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final AppointmentRepository _myAppointmentRepository;
  AppointmentCubit(this._myAppointmentRepository)
    : super(AppointmentState.initial());

  void emitAppointmentStates() async {
    emit(AppointmentState.loading());
    final response = await _myAppointmentRepository.getAppointmentByPatientId();

    switch (response) {
      case api_result.Success(:final data):
        final appointmentStatusData = AppointmentStatusData(
          upcoming:
              data.data
                  .where((a) => a.status == AppointmentStatus.Pending)
                  .toList(),
          completed:
              data.data
                  .where((a) => a.status == AppointmentStatus.Completed)
                  .toList(),
          cancelled:
              data.data
                  .where((a) => a.status == AppointmentStatus.Cancelled)
                  .toList(),
        );
        emit(AppointmentState.success(appointmentStatusData));
        break;

      case api_result.Failure(:final error):
        emit(AppointmentState.failure(error.apiErrorModel.message ?? ''));
        break;
    }
  }

  void emitCancelAppointment(int appointmentId) async {
    emit(AppointmentState.loading());
    final response = await _myAppointmentRepository.cancelAppointment(
      appointmentId,
    );

    switch (response) {
      case api_result.Success(:final data):
        emit(AppointmentState<void>.success(data));
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

    switch (response) {
      case api_result.Success(:final data):
        emit(AppointmentState<void>.success(data));
        break;

      case api_result.Failure(:final error):
        emit(AppointmentState.failure(error.apiErrorModel.message ?? ''));
        break;
    }
  }
}
