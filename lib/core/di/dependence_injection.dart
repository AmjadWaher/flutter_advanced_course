import 'package:completed_flutter_projects/core/networking/api_service.dart';
import 'package:completed_flutter_projects/core/networking/dio_factory.dart';
import 'package:completed_flutter_projects/features/book_appointment/data/api/booking_api_service.dart';
import 'package:completed_flutter_projects/features/book_appointment/data/repository/booking_repository.dart';
import 'package:completed_flutter_projects/features/book_appointment/data/repository/payment_repository.dart';
import 'package:completed_flutter_projects/features/home/data/apis/home_api_service.dart';
import 'package:completed_flutter_projects/features/home/data/repository/home_repository.dart';
import 'package:completed_flutter_projects/features/login/data/repository/login_repository.dart';
import 'package:completed_flutter_projects/features/login/logic/cubit/login_cubit.dart';
import 'package:completed_flutter_projects/features/appointment/data/api/appointment_api_service.dart';
import 'package:completed_flutter_projects/features/appointment/data/repository/appointment_repository.dart';
import 'package:completed_flutter_projects/features/profile/data/api/profile_api_service.dart';
import 'package:completed_flutter_projects/features/profile/data/repository/profile_repository.dart';
import 'package:completed_flutter_projects/features/signup/data/repository/sign_up_repository.dart';
import 'package:completed_flutter_projects/features/signup/logic/cubit/sign_up_cubit.dart';
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
  getIt.registerLazySingleton<SignUpRepository>(
    () => SignUpRepository(getIt()),
  );
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

  // home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepository(getIt()));

  // booking
  getIt.registerLazySingleton<BookingApiService>(() => BookingApiService(dio));
  getIt.registerLazySingleton<BookingRepository>(
    () => BookingRepository(getIt()),
  );
  getIt.registerLazySingleton<PaymentRepository>(
    () => PaymentRepository(getIt()),
  );

  // my appointment
  getIt.registerLazySingleton<AppointmentApiService>(
    () => AppointmentApiService(dio),
  );
  getIt.registerLazySingleton<AppointmentRepository>(
    () => AppointmentRepository(getIt()),
  );

  // Profile
  getIt.registerLazySingleton<ProfileApiService>(() => ProfileApiService(dio));
  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepository(getIt()),
  );
}
