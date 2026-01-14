import 'package:completed_flutter_projects/features/book_appointment/data/models/credit_card.dart';
import 'package:completed_flutter_projects/features/book_appointment/logic/enums/card_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'payment_state.freezed.dart';

@freezed
abstract class PaymentState with _$PaymentState {
  const factory PaymentState({
    @Default([]) List<CreditCard> savedCards,
    @Default(CardType.unknown) CardType cardType,
    @Default('Cash') String paymentMethod,
    CreditCard? creditCard,
    String? paymentIntentId,
    @Default(false) bool isSuccess,
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    String? errorMessage,
  }) = _PaymentState;
}
