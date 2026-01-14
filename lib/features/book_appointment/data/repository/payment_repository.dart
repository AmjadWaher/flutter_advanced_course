import 'package:completed_flutter_projects/core/networking/api_error_handler.dart';
import 'package:completed_flutter_projects/core/networking/api_result.dart';
import 'package:completed_flutter_projects/features/book_appointment/data/api/booking_api_service.dart';
import 'package:completed_flutter_projects/features/book_appointment/data/models/pay_cash_response.dart';
import 'package:completed_flutter_projects/features/book_appointment/data/models/payment_request.dart';
import 'package:completed_flutter_projects/features/book_appointment/data/models/payment_response.dart';
import 'package:completed_flutter_projects/features/book_appointment/data/models/saved_cards_response.dart';

class PaymentRepository {
  final BookingApiService _bookingApiService;

  PaymentRepository(this._bookingApiService);

  Future<ApiResult<PaymentResponse>> createPaymentIntent(
    PaymentRequest request,
  ) async {
    try {
      final response = await _bookingApiService.createPaymentIntent(request);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<PaymentResponse>> setupIntent() async {
    try {
      final response = await _bookingApiService.setupIntent();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<SavedCardsResponse>> savedCards() async {
    try {
      final response = await _bookingApiService.savedCards();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<PayCashResponse>> payCash(int appointmentId) async {
    try {
      final response = await _bookingApiService.payCash(appointmentId);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
