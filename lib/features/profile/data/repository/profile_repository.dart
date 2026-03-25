import 'package:completed_flutter_projects/core/helpers/constants.dart';
import 'package:completed_flutter_projects/core/helpers/shared_pref_helper.dart';
import 'package:completed_flutter_projects/core/networking/api_error_handler.dart';
import 'package:completed_flutter_projects/core/networking/api_result.dart';
import 'package:completed_flutter_projects/features/profile/data/api/profile_api_service.dart';
import 'package:completed_flutter_projects/features/profile/data/models/profile_response.dart';
import 'package:dio/dio.dart';

class ProfileRepository {
  final ProfileApiService _profileApiService;
  ProfileRepository(this._profileApiService);

  Future<ApiResult<ProfileResponse>> getProfile() async {
    try {
      final response = await _profileApiService.getProfile();

      await SharedPrefHelper.setData(
        SharedPrefKeys.userImage,
        response.data.photo,
      );

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<ProfileResponse>> updateProfile(FormData data) async {
    try {
      final response = await _profileApiService.updateProfile(data);

      await SharedPrefHelper.setData(
        SharedPrefKeys.userName,
        response.data.userName,
      );

      await SharedPrefHelper.setData(
        SharedPrefKeys.userImage,
        response.data.photo,
      );

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
