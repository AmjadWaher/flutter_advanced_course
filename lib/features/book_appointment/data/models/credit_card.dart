// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';
part 'saved_card.g.dart';

@JsonSerializable(createToJson: false)
class CreditCard {
  String id;
  String brand;
  String last4;
  int expMonth;
  int expYear;

  CreditCard({
    required this.id,
    required this.brand,
    required this.last4,
    required this.expMonth,
    required this.expYear,
  });

  factory CreditCard.fromJson(Map<String, dynamic> json) =>
      _$SavedCardFromJson(json);
}
