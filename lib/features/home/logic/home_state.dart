import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState<T1, T2> with _$HomeState<T1, T2> {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.success(T1 specialtyData, T2 doctorData) =
      Success<T1, T2>;
  const factory HomeState.error({required String message}) = Error;
  const factory HomeState.loading() = Loading;
}
