import 'package:completed_flutter_projects/core/networking/api_constants.dart';
import 'package:completed_flutter_projects/features/login/data/models/login_request_body.dart';
import 'package:completed_flutter_projects/features/login/data/models/login_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.signup)
  Future<SignUpResponse> signup(
    @Body() SignUpRequestBody loginRequestBody,
  );
}
