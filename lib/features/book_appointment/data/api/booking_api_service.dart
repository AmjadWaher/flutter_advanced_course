import 'package:completed_flutter_projects/core/networking/api_constants.dart';
import 'package:completed_flutter_projects/features/appointment/data/api/booking_api_constants.dart';
import 'package:completed_flutter_projects/features/appointment/data/models/booking_request.dart';
import 'package:completed_flutter_projects/features/appointment/data/models/booking_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'booking_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class BookingApiService {
  factory BookingApiService(Dio dio, {String baseUrl}) =
      _BookingApiService;

  @POST(BookingApiConstants.bookAppointment)
  Future<BookingResponse> submitBooking(
    @Body() BookingRequest appointmentRequest,
  );
}
