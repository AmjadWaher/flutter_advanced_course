import 'package:freezed_annotation/freezed_annotation.dart';
part 'delete_card_response.g.dart';

@JsonSerializable()
class DeleteCardResponse {
  int code;
  String message;
  DeleteCardResponse({required this.code, required this.message});

  factory DeleteCardResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteCardResponseFromJson(json);
}
