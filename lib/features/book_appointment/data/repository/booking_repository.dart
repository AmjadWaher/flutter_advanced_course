import 'package:completed_flutter_projects/core/networking/api_error_handler.dart';
import 'package:completed_flutter_projects/core/networking/api_result.dart';
import 'package:completed_flutter_projects/features/book_appointment/data/api/booking_api_service.dart';
import 'package:completed_flutter_projects/features/book_appointment/data/models/booking_request.dart';
import 'package:completed_flutter_projects/features/book_appointment/data/models/booking_response.dart';

class BookingRepository {
  final BookingApiService _bookingApiService;

  BookingRepository(this._bookingApiService);

  Future<ApiResult<BookingResponse>> submitBooking(
    BookingRequest bookingRequest,
  ) async {
    try {
      final response = await _bookingApiService.submitBooking(
        bookingRequest,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
