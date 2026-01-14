import 'package:completed_flutter_projects/core/networking/api_result.dart'
    as api_result;
import 'package:completed_flutter_projects/features/book_appointment/data/models/credit_card.dart';
import 'package:completed_flutter_projects/features/book_appointment/data/models/payment_request.dart';
import 'package:completed_flutter_projects/features/book_appointment/data/repository/payment_repository.dart';
import 'package:completed_flutter_projects/features/book_appointment/logic/cubit/payment/payment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepository _paymentRepository;
  PaymentCubit(this._paymentRepository) : super(const PaymentState());

  void selectPaymentMethod(String method) {
    emit(state.copyWith(paymentMethod: method));
  }

  void selectCardToPayment(CreditCard card) {
    emit(state.copyWith(creditCard: card));
  }

  Future<void> payForBooking(int appointmentId) async {
    emit(state.copyWith(isLoading: true, isError: false, isSuccess: false));
    final response = await _paymentRepository.createPaymentIntent(
      PaymentRequest(
        appointmentId: appointmentId,
        paymentMethodId: state.creditCard?.id ?? '',
      ),
    );

    switch (response) {
      case api_result.Success(:final data):
        emit(
          state.copyWith(
            paymentIntentId: data.data['paymentIntentId'],
            isSuccess: true,
            isLoading: false,
          ),
        );
      case api_result.Failure(:final error):
        emit(
          state.copyWith(
            isLoading: false,
            isError: true,
            errorMessage: error.apiErrorModel.message,
          ),
        );
    }
  }

  Future<String> setupIntent() async {
    final response = await _paymentRepository.setupIntent();

    switch (response) {
      case api_result.Success(:final data):
        return data.data['clientSecret'] ?? '';
      case api_result.Failure():
        throw Exception('Unauthorized');
    }
    throw Exception('Unexpected response');
  }

  void savedCards() async {
    emit(state.copyWith(isLoading: true, isSuccess: false, isError: false));
    final response = await _paymentRepository.savedCards();
    switch (response) {
      case api_result.Success(:final data):
        emit(state.copyWith(savedCards: data.data, isLoading: false));
    }
  }

  void payCash(int appointmentId) async {
    final response = await _paymentRepository.payCash(appointmentId);
    switch (response) {
      case api_result.Success():
        emit(state.copyWith(isSuccess: true, isLoading: false));
      case api_result.Failure(:final error):
        emit(
          state.copyWith(
            isLoading: false,
            isError: true,
            errorMessage: error.apiErrorModel.message,
          ),
        );
    }
  }
}
