import 'package:completed_flutter_projects/core/networking/api_error_handler.dart';
import 'package:completed_flutter_projects/core/networking/api_result.dart';
import 'package:completed_flutter_projects/features/appointment/data/api/appointment_api_service.dart';
import 'package:completed_flutter_projects/features/appointment/data/models/appointment_response.dart';
import 'package:completed_flutter_projects/features/appointment/data/models/appointments_response.dart';
import 'package:completed_flutter_projects/features/appointment/data/models/reschedule_request.dart';

class AppointmentRepository {
  final AppointmentApiService appointmentApiService;
  AppointmentRepository(this.appointmentApiService);

  Future<ApiResult<AppointmentsResponse>> getAppointmentByPatientId() async {
    try {
      final response =
          await appointmentApiService.getAppointmentByPatientId();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<AppointmentResponse>> cancelAppointment(int appointmentId) async {
    try {
      final response = await appointmentApiService.cancelAppointment(
        appointmentId,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<AppointmentResponse>> rescheduleAppointment(
    RescheduleRequest request,
  ) async {
    try {
      final response = await appointmentApiService.rescheduleAppointment(
        request,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
