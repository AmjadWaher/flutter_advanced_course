// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookingState {

 DateTime? get selectedDate; String? get selectedTime; String get paymentMethod; bool get isConfirmed; bool get isLoading; bool get isError; String? get errorMessage;
/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingStateCopyWith<BookingState> get copyWith => _$BookingStateCopyWithImpl<BookingState>(this as BookingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingState&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&(identical(other.selectedTime, selectedTime) || other.selectedTime == selectedTime)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.isConfirmed, isConfirmed) || other.isConfirmed == isConfirmed)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,selectedDate,selectedTime,paymentMethod,isConfirmed,isLoading,isError,errorMessage);

@override
String toString() {
  return 'BookingState(selectedDate: $selectedDate, selectedTime: $selectedTime, paymentMethod: $paymentMethod, isConfirmed: $isConfirmed, isLoading: $isLoading, isError: $isError, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $BookingStateCopyWith<$Res>  {
  factory $BookingStateCopyWith(BookingState value, $Res Function(BookingState) _then) = _$BookingStateCopyWithImpl;
@useResult
$Res call({
 DateTime? selectedDate, String? selectedTime, String paymentMethod, bool isConfirmed, bool isLoading, bool isError, String? errorMessage
});




}
/// @nodoc
class _$BookingStateCopyWithImpl<$Res>
    implements $BookingStateCopyWith<$Res> {
  _$BookingStateCopyWithImpl(this._self, this._then);

  final BookingState _self;
  final $Res Function(BookingState) _then;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedDate = freezed,Object? selectedTime = freezed,Object? paymentMethod = null,Object? isConfirmed = null,Object? isLoading = null,Object? isError = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
selectedDate: freezed == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,selectedTime: freezed == selectedTime ? _self.selectedTime : selectedTime // ignore: cast_nullable_to_non_nullable
as String?,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,isConfirmed: null == isConfirmed ? _self.isConfirmed : isConfirmed // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _BookingState implements BookingState {
  const _BookingState({this.selectedDate, this.selectedTime, this.paymentMethod = 'Cash', this.isConfirmed = false, this.isLoading = false, this.isError = false, this.errorMessage});
  

@override final  DateTime? selectedDate;
@override final  String? selectedTime;
@override@JsonKey() final  String paymentMethod;
@override@JsonKey() final  bool isConfirmed;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isError;
@override final  String? errorMessage;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingStateCopyWith<_BookingState> get copyWith => __$BookingStateCopyWithImpl<_BookingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingState&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&(identical(other.selectedTime, selectedTime) || other.selectedTime == selectedTime)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.isConfirmed, isConfirmed) || other.isConfirmed == isConfirmed)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,selectedDate,selectedTime,paymentMethod,isConfirmed,isLoading,isError,errorMessage);

@override
String toString() {
  return 'BookingState(selectedDate: $selectedDate, selectedTime: $selectedTime, paymentMethod: $paymentMethod, isConfirmed: $isConfirmed, isLoading: $isLoading, isError: $isError, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$BookingStateCopyWith<$Res> implements $BookingStateCopyWith<$Res> {
  factory _$BookingStateCopyWith(_BookingState value, $Res Function(_BookingState) _then) = __$BookingStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime? selectedDate, String? selectedTime, String paymentMethod, bool isConfirmed, bool isLoading, bool isError, String? errorMessage
});




}
/// @nodoc
class __$BookingStateCopyWithImpl<$Res>
    implements _$BookingStateCopyWith<$Res> {
  __$BookingStateCopyWithImpl(this._self, this._then);

  final _BookingState _self;
  final $Res Function(_BookingState) _then;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedDate = freezed,Object? selectedTime = freezed,Object? paymentMethod = null,Object? isConfirmed = null,Object? isLoading = null,Object? isError = null,Object? errorMessage = freezed,}) {
  return _then(_BookingState(
selectedDate: freezed == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,selectedTime: freezed == selectedTime ? _self.selectedTime : selectedTime // ignore: cast_nullable_to_non_nullable
as String?,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,isConfirmed: null == isConfirmed ? _self.isConfirmed : isConfirmed // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
