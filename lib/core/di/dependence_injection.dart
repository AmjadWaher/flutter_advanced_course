import 'package:completed_flutter_projects/core/networking/api_service.dart';
import 'package:completed_flutter_projects/core/networking/dio_factory.dart';
import 'package:completed_flutter_projects/features/login/data/repository/login_repository.dart';
import 'package:completed_flutter_projects/features/login/logic/cubit/login_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  // Dop & ApiService
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt
      .registerLazySingleton<SignUpRepository>(() => SignUpRepository(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

  // home
}
