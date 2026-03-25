import 'dart:io';

import 'package:completed_flutter_projects/features/profile/data/models/profile_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = Loading;
  const factory ProfileState.success({
    required ProfileResponse data,
    File? selectedImage,
  }) = Success;
  const factory ProfileState.failure({required String message}) = Failure;
}
