// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState<T1,T2> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState<T1, T2>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState<$T1, $T2>()';
}


}

/// @nodoc
class $HomeStateCopyWith<T1,T2,$Res>  {
$HomeStateCopyWith(HomeState<T1, T2> _, $Res Function(HomeState<T1, T2>) __);
}


/// @nodoc


class _Initial<T1,T2> implements HomeState<T1, T2> {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial<T1, T2>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState<$T1, $T2>.initial()';
}


}




/// @nodoc


class Success<T1,T2> implements HomeState<T1, T2> {
  const Success(this.specialtyData, this.doctorData);
  

 final  T1 specialtyData;
 final  T2 doctorData;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCopyWith<T1, T2, Success<T1, T2>> get copyWith => _$SuccessCopyWithImpl<T1, T2, Success<T1, T2>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success<T1, T2>&&const DeepCollectionEquality().equals(other.specialtyData, specialtyData)&&const DeepCollectionEquality().equals(other.doctorData, doctorData));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(specialtyData),const DeepCollectionEquality().hash(doctorData));

@override
String toString() {
  return 'HomeState<$T1, $T2>.success(specialtyData: $specialtyData, doctorData: $doctorData)';
}


}

/// @nodoc
abstract mixin class $SuccessCopyWith<T1,T2,$Res> implements $HomeStateCopyWith<T1, T2, $Res> {
  factory $SuccessCopyWith(Success<T1, T2> value, $Res Function(Success<T1, T2>) _then) = _$SuccessCopyWithImpl;
@useResult
$Res call({
 T1 specialtyData, T2 doctorData
});




}
/// @nodoc
class _$SuccessCopyWithImpl<T1,T2,$Res>
    implements $SuccessCopyWith<T1, T2, $Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success<T1, T2> _self;
  final $Res Function(Success<T1, T2>) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? specialtyData = freezed,Object? doctorData = freezed,}) {
  return _then(Success<T1, T2>(
freezed == specialtyData ? _self.specialtyData : specialtyData // ignore: cast_nullable_to_non_nullable
as T1,freezed == doctorData ? _self.doctorData : doctorData // ignore: cast_nullable_to_non_nullable
as T2,
  ));
}


}

/// @nodoc


class Error<T1,T2> implements HomeState<T1, T2> {
  const Error({required this.message});
  

 final  String message;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<T1, T2, Error<T1, T2>> get copyWith => _$ErrorCopyWithImpl<T1, T2, Error<T1, T2>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error<T1, T2>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'HomeState<$T1, $T2>.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<T1,T2,$Res> implements $HomeStateCopyWith<T1, T2, $Res> {
  factory $ErrorCopyWith(Error<T1, T2> value, $Res Function(Error<T1, T2>) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<T1,T2,$Res>
    implements $ErrorCopyWith<T1, T2, $Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error<T1, T2> _self;
  final $Res Function(Error<T1, T2>) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error<T1, T2>(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Loading<T1,T2> implements HomeState<T1, T2> {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading<T1, T2>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState<$T1, $T2>.loading()';
}


}




// dart format on
