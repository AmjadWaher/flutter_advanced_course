import 'package:completed_flutter_projects/core/networking/api_constants.dart';
import 'package:completed_flutter_projects/features/my_appointment/data/api/appointment_api_constants.dart';
import 'package:completed_flutter_projects/features/my_appointment/data/models/appointment_response.dart';
import 'package:completed_flutter_projects/features/my_appointment/data/models/reschedule_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'appointment_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AppointmentApiService {
  factory AppointmentApiService(Dio dio, {String baseUrl}) =
      _AppointmentApiService;

  @GET(AppointmentApiConstants.appointmentByPatient)
  Future<AppointmentsResponse> getAppointmentByPatientId();

  @PUT('${AppointmentApiConstants.cancelAppointment}/{appointmentId}')
  Future<void> cancelAppointment(@Path("appointmentId") int appointmentId);

  @PUT(AppointmentApiConstants.rescheduleAppointment)
  Future<void> rescheduleAppointment(
    @Body() RescheduleRequest rescheduleRequest,
  );
}
