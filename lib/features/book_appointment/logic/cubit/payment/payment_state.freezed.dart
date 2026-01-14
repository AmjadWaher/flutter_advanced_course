// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaymentState {

 List<CreditCard> get savedCards; CardType get cardType; String get paymentMethod; CreditCard? get creditCard; String? get paymentIntentId; bool get isSuccess; bool get isLoading; bool get isError; String? get errorMessage;
/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentStateCopyWith<PaymentState> get copyWith => _$PaymentStateCopyWithImpl<PaymentState>(this as PaymentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentState&&const DeepCollectionEquality().equals(other.savedCards, savedCards)&&(identical(other.cardType, cardType) || other.cardType == cardType)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.creditCard, creditCard) || other.creditCard == creditCard)&&(identical(other.paymentIntentId, paymentIntentId) || other.paymentIntentId == paymentIntentId)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(savedCards),cardType,paymentMethod,creditCard,paymentIntentId,isSuccess,isLoading,isError,errorMessage);

@override
String toString() {
  return 'PaymentState(savedCards: $savedCards, cardType: $cardType, paymentMethod: $paymentMethod, creditCard: $creditCard, paymentIntentId: $paymentIntentId, isSuccess: $isSuccess, isLoading: $isLoading, isError: $isError, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PaymentStateCopyWith<$Res>  {
  factory $PaymentStateCopyWith(PaymentState value, $Res Function(PaymentState) _then) = _$PaymentStateCopyWithImpl;
@useResult
$Res call({
 List<CreditCard> savedCards, CardType cardType, String paymentMethod, CreditCard? creditCard, String? paymentIntentId, bool isSuccess, bool isLoading, bool isError, String? errorMessage
});




}
/// @nodoc
class _$PaymentStateCopyWithImpl<$Res>
    implements $PaymentStateCopyWith<$Res> {
  _$PaymentStateCopyWithImpl(this._self, this._then);

  final PaymentState _self;
  final $Res Function(PaymentState) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? savedCards = null,Object? cardType = null,Object? paymentMethod = null,Object? creditCard = freezed,Object? paymentIntentId = freezed,Object? isSuccess = null,Object? isLoading = null,Object? isError = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
savedCards: null == savedCards ? _self.savedCards : savedCards // ignore: cast_nullable_to_non_nullable
as List<CreditCard>,cardType: null == cardType ? _self.cardType : cardType // ignore: cast_nullable_to_non_nullable
as CardType,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,creditCard: freezed == creditCard ? _self.creditCard : creditCard // ignore: cast_nullable_to_non_nullable
as CreditCard?,paymentIntentId: freezed == paymentIntentId ? _self.paymentIntentId : paymentIntentId // ignore: cast_nullable_to_non_nullable
as String?,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _PaymentState implements PaymentState {
  const _PaymentState({final  List<CreditCard> savedCards = const [], this.cardType = CardType.unknown, this.paymentMethod = 'Cash', this.creditCard, this.paymentIntentId, this.isSuccess = false, this.isLoading = false, this.isError = false, this.errorMessage}): _savedCards = savedCards;
  

 final  List<CreditCard> _savedCards;
@override@JsonKey() List<CreditCard> get savedCards {
  if (_savedCards is EqualUnmodifiableListView) return _savedCards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_savedCards);
}

@override@JsonKey() final  CardType cardType;
@override@JsonKey() final  String paymentMethod;
@override final  CreditCard? creditCard;
@override final  String? paymentIntentId;
@override@JsonKey() final  bool isSuccess;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isError;
@override final  String? errorMessage;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentStateCopyWith<_PaymentState> get copyWith => __$PaymentStateCopyWithImpl<_PaymentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentState&&const DeepCollectionEquality().equals(other._savedCards, _savedCards)&&(identical(other.cardType, cardType) || other.cardType == cardType)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.creditCard, creditCard) || other.creditCard == creditCard)&&(identical(other.paymentIntentId, paymentIntentId) || other.paymentIntentId == paymentIntentId)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_savedCards),cardType,paymentMethod,creditCard,paymentIntentId,isSuccess,isLoading,isError,errorMessage);

@override
String toString() {
  return 'PaymentState(savedCards: $savedCards, cardType: $cardType, paymentMethod: $paymentMethod, creditCard: $creditCard, paymentIntentId: $paymentIntentId, isSuccess: $isSuccess, isLoading: $isLoading, isError: $isError, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$PaymentStateCopyWith<$Res> implements $PaymentStateCopyWith<$Res> {
  factory _$PaymentStateCopyWith(_PaymentState value, $Res Function(_PaymentState) _then) = __$PaymentStateCopyWithImpl;
@override @useResult
$Res call({
 List<CreditCard> savedCards, CardType cardType, String paymentMethod, CreditCard? creditCard, String? paymentIntentId, bool isSuccess, bool isLoading, bool isError, String? errorMessage
});




}
/// @nodoc
class __$PaymentStateCopyWithImpl<$Res>
    implements _$PaymentStateCopyWith<$Res> {
  __$PaymentStateCopyWithImpl(this._self, this._then);

  final _PaymentState _self;
  final $Res Function(_PaymentState) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? savedCards = null,Object? cardType = null,Object? paymentMethod = null,Object? creditCard = freezed,Object? paymentIntentId = freezed,Object? isSuccess = null,Object? isLoading = null,Object? isError = null,Object? errorMessage = freezed,}) {
  return _then(_PaymentState(
savedCards: null == savedCards ? _self._savedCards : savedCards // ignore: cast_nullable_to_non_nullable
as List<CreditCard>,cardType: null == cardType ? _self.cardType : cardType // ignore: cast_nullable_to_non_nullable
as CardType,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,creditCard: freezed == creditCard ? _self.creditCard : creditCard // ignore: cast_nullable_to_non_nullable
as CreditCard?,paymentIntentId: freezed == paymentIntentId ? _self.paymentIntentId : paymentIntentId // ignore: cast_nullable_to_non_nullable
as String?,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
