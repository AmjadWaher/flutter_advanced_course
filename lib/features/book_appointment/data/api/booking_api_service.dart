import 'package:completed_flutter_projects/core/networking/api_constants.dart';
import 'package:completed_flutter_projects/features/book_appointment/data/api/booking_api_constants.dart';
import 'package:completed_flutter_projects/features/book_appointment/data/models/booking_request.dart';
import 'package:completed_flutter_projects/features/book_appointment/data/models/booking_response.dart';
import 'package:completed_flutter_projects/features/book_appointment/data/models/delete_card_response.dart';
import 'package:completed_flutter_projects/features/book_appointment/data/models/pay_cash_response.dart';
import 'package:completed_flutter_projects/features/book_appointment/data/models/payment_request.dart';
import 'package:completed_flutter_projects/features/book_appointment/data/models/payment_response.dart';
import 'package:completed_flutter_projects/features/book_appointment/data/models/saved_cards_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'booking_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class BookingApiService {
  factory BookingApiService(Dio dio, {String baseUrl}) = _BookingApiService;

  @POST(BookingApiConstants.bookAppointment)
  Future<BookingResponse> submitBooking(
    @Body() BookingRequest appointmentRequest,
  );

  @POST(BookingApiConstants.createPaymentIntent)
  Future<PaymentResponse> createPaymentIntent(
    @Body() PaymentRequest paymentRequest,
  );

  @POST(BookingApiConstants.setupIntent)
  Future<PaymentResponse> setupIntent();

  @POST('${BookingApiConstants.payCash}/{appointmentId}')
  Future<PayCashResponse> payCash(@Path('appointmentId') int appointmentId);

  @DELETE('${BookingApiConstants.deleteCard}/{paymentMethodId}')
  Future<DeleteCardResponse> deleteCard(
    @Path('paymentMethodId') String paymentMethodId,
  );

  @GET(BookingApiConstants.savedCards)
  Future<SavedCardsResponse> savedCards();
}
