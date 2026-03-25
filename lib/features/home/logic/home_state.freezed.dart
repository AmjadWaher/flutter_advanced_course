// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns<T1,T2> on HomeState<T1, T2> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial<T1, T2> value)?  initial,TResult Function( Success<T1, T2> value)?  success,TResult Function( Error<T1, T2> value)?  error,TResult Function( Loading<T1, T2> value)?  loading,TResult Function( HomeUserNameLoaded<T1, T2> value)?  homeUserNameLoaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Success() when success != null:
return success(_that);case Error() when error != null:
return error(_that);case Loading() when loading != null:
return loading(_that);case HomeUserNameLoaded() when homeUserNameLoaded != null:
return homeUserNameLoaded(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial<T1, T2> value)  initial,required TResult Function( Success<T1, T2> value)  success,required TResult Function( Error<T1, T2> value)  error,required TResult Function( Loading<T1, T2> value)  loading,required TResult Function( HomeUserNameLoaded<T1, T2> value)  homeUserNameLoaded,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case Success():
return success(_that);case Error():
return error(_that);case Loading():
return loading(_that);case HomeUserNameLoaded():
return homeUserNameLoaded(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial<T1, T2> value)?  initial,TResult? Function( Success<T1, T2> value)?  success,TResult? Function( Error<T1, T2> value)?  error,TResult? Function( Loading<T1, T2> value)?  loading,TResult? Function( HomeUserNameLoaded<T1, T2> value)?  homeUserNameLoaded,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Success() when success != null:
return success(_that);case Error() when error != null:
return error(_that);case Loading() when loading != null:
return loading(_that);case HomeUserNameLoaded() when homeUserNameLoaded != null:
return homeUserNameLoaded(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( T1 specialtyData,  T2 doctorData)?  success,TResult Function( String message)?  error,TResult Function()?  loading,TResult Function( String userName)?  homeUserNameLoaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Success() when success != null:
return success(_that.specialtyData,_that.doctorData);case Error() when error != null:
return error(_that.message);case Loading() when loading != null:
return loading();case HomeUserNameLoaded() when homeUserNameLoaded != null:
return homeUserNameLoaded(_that.userName);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( T1 specialtyData,  T2 doctorData)  success,required TResult Function( String message)  error,required TResult Function()  loading,required TResult Function( String userName)  homeUserNameLoaded,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case Success():
return success(_that.specialtyData,_that.doctorData);case Error():
return error(_that.message);case Loading():
return loading();case HomeUserNameLoaded():
return homeUserNameLoaded(_that.userName);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( T1 specialtyData,  T2 doctorData)?  success,TResult? Function( String message)?  error,TResult? Function()?  loading,TResult? Function( String userName)?  homeUserNameLoaded,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Success() when success != null:
return success(_that.specialtyData,_that.doctorData);case Error() when error != null:
return error(_that.message);case Loading() when loading != null:
return loading();case HomeUserNameLoaded() when homeUserNameLoaded != null:
return homeUserNameLoaded(_that.userName);case _:
  return null;

}
}

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




/// @nodoc


class HomeUserNameLoaded<T1,T2> implements HomeState<T1, T2> {
  const HomeUserNameLoaded({required this.userName});
  

 final  String userName;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeUserNameLoadedCopyWith<T1, T2, HomeUserNameLoaded<T1, T2>> get copyWith => _$HomeUserNameLoadedCopyWithImpl<T1, T2, HomeUserNameLoaded<T1, T2>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeUserNameLoaded<T1, T2>&&(identical(other.userName, userName) || other.userName == userName));
}


@override
int get hashCode => Object.hash(runtimeType,userName);

@override
String toString() {
  return 'HomeState<$T1, $T2>.homeUserNameLoaded(userName: $userName)';
}


}

/// @nodoc
abstract mixin class $HomeUserNameLoadedCopyWith<T1,T2,$Res> implements $HomeStateCopyWith<T1, T2, $Res> {
  factory $HomeUserNameLoadedCopyWith(HomeUserNameLoaded<T1, T2> value, $Res Function(HomeUserNameLoaded<T1, T2>) _then) = _$HomeUserNameLoadedCopyWithImpl;
@useResult
$Res call({
 String userName
});




}
/// @nodoc
class _$HomeUserNameLoadedCopyWithImpl<T1,T2,$Res>
    implements $HomeUserNameLoadedCopyWith<T1, T2, $Res> {
  _$HomeUserNameLoadedCopyWithImpl(this._self, this._then);

  final HomeUserNameLoaded<T1, T2> _self;
  final $Res Function(HomeUserNameLoaded<T1, T2>) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userName = null,}) {
  return _then(HomeUserNameLoaded<T1, T2>(
userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
