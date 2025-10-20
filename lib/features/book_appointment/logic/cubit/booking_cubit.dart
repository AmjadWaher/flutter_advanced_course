import 'package:completed_flutter_projects/core/networking/api_result.dart'
    as api_result;
import 'package:completed_flutter_projects/features/appointment/data/models/booking_request.dart';
import 'package:completed_flutter_projects/features/appointment/data/repository/booking_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:completed_flutter_projects/features/appointment/logic/cubit/booking_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingCubit extends Cubit<BookingState> {
  final BookingRepository _bookingRepository;

  final horizontalController = ScrollController();
  final verticalController = ScrollController();

  BookingCubit(this._bookingRepository)
    : super(BookingState(selectedDate: DateTime.now()));

  void selectDate(DateTime date) {
    emit(state.copyWith(selectedDate: date));
  }

  void selectTime(String time) {
    emit(state.copyWith(selectedTime: time));
  }

  void selectPayment(String method) {
    emit(state.copyWith(paymentMethod: method));
  }

  Future<void> submitBooking(String doctorId, double price) async {
    emit(state.copyWith(isLoading: true, isConfirmed: true));
    final response = await _bookingRepository.submitBooking(
      BookingRequest(
        doctorId: doctorId,
        time: state.selectedTime!,
        date: state.selectedDate!.toIso8601String(),
        price: price,
        paymentMethod: state.paymentMethod,
      ),
    );

    switch (response) {
      case api_result.Success():
        emit(
          state.copyWith(isLoading: false, isConfirmed: true, isError: false),
        );
      case api_result.Failure(:final error):
        emit(
          state.copyWith(
            isLoading: false,
            isConfirmed: false,
            isError: true,
            errorMessage: error.apiErrorModel.message ,//'Booking Not Confirmed',
          ),
        );
    }
  }

  void scrollVerticalToSelected(DateTime time, DateTime startTime) {
    final index = time.difference(startTime).inMinutes ~/ 30;

    final rowIndex = index ~/ 2;
    final itemHeight = 45.w + 12;
    final visibleHeight = 210.h;

    final offset =
        (rowIndex * itemHeight) - (visibleHeight / 2) + (itemHeight / 2);

    if (verticalController.hasClients) {
      verticalController.animateTo(
        offset.clamp(0, verticalController.position.maxScrollExtent),
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
      );
    }
  }

  void scrollHorizontalToSelected(DateTime date) {
    final index = date.difference(DateTime.now()).inDays;
    if (index < 0 || index >= 30) return;

    final itemWidth = 60.w;
    final screenWidth = 200.w;

    final offset = (index * itemWidth) - (screenWidth / 2) + (itemWidth / 2);

    horizontalController.animateTo(
      offset.clamp(0, horizontalController.position.maxScrollExtent),
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
    );
  }

  @override
  Future<void> close() {
    horizontalController.dispose();
    verticalController.dispose();
    return super.close();
  }
}
