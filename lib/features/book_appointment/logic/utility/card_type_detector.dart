import 'package:completed_flutter_projects/features/book_appointment/logic/enums/card_type.dart';

class CardTypeDetector {
  static CardType detect(String input) {
    final number = input.replaceAll(RegExp(r'\s+'), '');

    if (number.startsWith('4')) return CardType.visa;
    if (RegExp(r'^(5[1-5])').hasMatch(number)) return CardType.mastercard;
    if (RegExp(r'^(34|37)').hasMatch(number)) return CardType.amex;
    if (RegExp(r'^(6011|65)').hasMatch(number)) return CardType.discover;
    return CardType.unknown;
  }
}
