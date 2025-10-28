import 'package:completed_flutter_projects/core/networking/api_result.dart'
    as api_result;
import 'package:completed_flutter_projects/features/appointment/data/models/appointment.dart';
import 'package:completed_flutter_projects/features/appointment/data/models/reschedule_request.dart';
import 'package:completed_flutter_projects/features/appointment/data/repository/appointment_repository.dart';
import 'package:completed_flutter_projects/features/appointment/logic/cubit/appointment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final AppointmentRepository _myAppointmentRepository;
  AppointmentCubit(this._myAppointmentRepository)
    : super(AppointmentState.initial());
  List<Appointment> upcoming = [];
  List<Appointment> completed = [];
  List<Appointment> cancelled = [];

  void _emitCurrentAppointments() {
    emit(
      AppointmentState.success(
        AppointmentStatusData(
          upcoming: List.from(upcoming),
          completed: List.from(completed),
          cancelled: List.from(cancelled),
        ),
      ),
    );
  }

  void emitAppointmentStates() async {
    emit(AppointmentState.loading());
    final response = await _myAppointmentRepository.getAppointmentByPatientId();

    switch (response) {
      case api_result.Success(:final data):
        for (var a in data.data) {
          switch (a.status) {
            case AppointmentStatus.Pending:
              upcoming.add(a);
              break;
            case AppointmentStatus.Completed:
              completed.add(a);
              break;
            case AppointmentStatus.Cancelled:
              cancelled.add(a);
              break;
          }
        }
        _emitCurrentAppointments();
        break;
      case api_result.Failure(:final error):
        emit(
          AppointmentState.failure(
            error.apiErrorModel.message ??
                'Something went wrong, Please try later',
          ),
        );
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
        upcoming.removeWhere((a) => a.id == appointmentId);
        cancelled.add(data.data);
        _emitCurrentAppointments();
        break;

      case api_result.Failure(:final error):
        emit(
          AppointmentState.failure(
            error.apiErrorModel.message ??
                'Something went wrong, Please try later',
          ),
        );
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
        upcoming.removeWhere((a) => a.id == request.id);
        upcoming.add(data.data);
        _emitCurrentAppointments();
        break;

      case api_result.Failure(:final error):
        emit(
          AppointmentState.failure(
            error.apiErrorModel.message ??
                'Something went wrong, Please try later',
          ),
        );
        break;
    }
  }
}
