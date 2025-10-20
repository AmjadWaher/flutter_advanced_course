import 'package:freezed_annotation/freezed_annotation.dart';
part 'booking_state.freezed.dart';

@freezed
abstract class BookingState with _$BookingState {
  const factory BookingState({
    DateTime? selectedDate,
    String? selectedTime,
    @Default('Cash') String paymentMethod,
    @Default(false) bool isConfirmed,
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    String? errorMessage,
  }) = _BookingState;
}
