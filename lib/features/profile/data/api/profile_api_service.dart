import 'package:completed_flutter_projects/core/networking/api_constants.dart';
import 'package:completed_flutter_projects/features/profile/data/api/profile_api_constants.dart';
import 'package:completed_flutter_projects/features/profile/data/models/profile_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'profile_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ProfileApiService {
  factory ProfileApiService(Dio dio, {String baseUrl}) = _ProfileApiService;

  @GET(ProfileApiConstants.getProfile)
  Future<ProfileResponse> getProfile();

  @PUT(ProfileApiConstants.updateProfile)
  Future<ProfileResponse> updateProfile(@Body() FormData data);
}
