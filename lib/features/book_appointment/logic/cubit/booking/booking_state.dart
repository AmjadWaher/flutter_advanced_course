import 'package:freezed_annotation/freezed_annotation.dart';
part 'booking_state.freezed.dart';

@freezed
abstract class BookingState with _$BookingState {
  const factory BookingState({
    DateTime? selectedDate,
    String? selectedTime,
    int? appointmentId,
    @Default(false) bool isSuccess,
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    String? errorMessage,
  }) = _BookingState;
}
