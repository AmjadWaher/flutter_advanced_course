import 'package:completed_flutter_projects/core/networking/api_error_handler.dart';
import 'package:completed_flutter_projects/core/networking/api_result.dart';
import 'package:completed_flutter_projects/features/home/data/apis/home_api_service.dart';
import 'package:completed_flutter_projects/features/home/data/models/doctor_response.dart';
import 'package:completed_flutter_projects/features/home/data/models/specialty_response.dart';

class HomeRepository {
  final HomeApiService _homeApiService;

  HomeRepository(this._homeApiService);

  Future<ApiResult<SpecialtyResponse>> getAllSpecialties() async {
    try {
      final response = await _homeApiService.getAllSpecialties();
      
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DoctorResponse>> getAllDoctors() async {
    try {
      final response = await _homeApiService.getAllDoctors();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
