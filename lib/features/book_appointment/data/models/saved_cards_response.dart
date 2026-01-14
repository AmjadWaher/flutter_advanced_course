// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:completed_flutter_projects/features/book_appointment/data/models/credit_card.dart';
part 'saved_cards_response.g.dart';

@JsonSerializable(createToJson: false)
class SavedCardsResponse {
  int code;
  String message;
  List<CreditCard> data;

  SavedCardsResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory SavedCardsResponse.fromJson(Map<String, dynamic> json) =>
      _$SavedCardsResponseFromJson(json);
}
