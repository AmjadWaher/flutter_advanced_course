import 'package:completed_flutter_projects/core/networking/api_constants.dart';
import 'package:completed_flutter_projects/features/home/data/apis/home_api_constants.dart';
import 'package:completed_flutter_projects/features/home/data/models/doctor_response.dart';
import 'package:completed_flutter_projects/features/home/data/models/specialty_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  @GET(HomeApiConstants.specialties)
  Future<SpecialtyResponse> getAllSpecialties();

  @GET(HomeApiConstants.doctors)
  Future<DoctorResponse> getAllDoctors();
}
