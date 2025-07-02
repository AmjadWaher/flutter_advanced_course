import 'package:completed_flutter_projects/core/networking/api_error_handler.dart';
import 'package:completed_flutter_projects/core/networking/api_result.dart';
import 'package:completed_flutter_projects/core/networking/api_service.dart';
import 'package:completed_flutter_projects/features/signup/data/models/sign_up_request_body.dart';
import 'package:completed_flutter_projects/features/signup/data/models/sign_up_response.dart';

class SignUpRepository {
  final ApiService _apiService;

  SignUpRepository(this._apiService);

  Future<ApiResult<SignUpResponse>> signup(
      SignUpRequestBody signUpRequestBody) async {
    try {
      final response = await _apiService.signup(signUpRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
