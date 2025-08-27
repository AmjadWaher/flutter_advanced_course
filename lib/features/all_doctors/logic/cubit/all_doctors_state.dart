
import 'package:freezed_annotation/freezed_annotation.dart';
part 'all_doctors_state.freezed.dart';

@freezed
class AllDoctorsState<T> with _$AllDoctorsState {
  const factory AllDoctorsState.initial() = _Initial;
  const factory AllDoctorsState.success(T doctors) = Success<T>;
  const factory AllDoctorsState.error({required String message}) = Error;
  const factory AllDoctorsState.loading() = Loading;
}
