// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:completed_flutter_projects/core/networking/api_result.dart'
    as api_result;
import 'package:completed_flutter_projects/features/home/data/models/doctor.dart';
import 'package:completed_flutter_projects/features/home/data/models/specialty_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:completed_flutter_projects/features/home/data/repository/home_repository.dart';
import 'package:completed_flutter_projects/features/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;
  HomeCubit(this._homeRepository) : super(const HomeState.initial());

  void emitSpecialtiesAndDoctorsStates() async {
    final specialtiesResult = await _homeRepository.getAllSpecialties();
    final doctorsResult = await _homeRepository.getAllDoctors();

    List<Specialty>? specialties;
    List<Doctor>? doctors;

    switch (specialtiesResult) {
      case api_result.Success(:final data):
        specialties = data.data;
        break;

      case api_result.Failure(:final error):
        emit(HomeState.error(message: error.apiErrorModel.message ?? ''));
        break;
    }

    switch (doctorsResult) {
      case api_result.Success(:final data):
        doctors = data.data;
        break;

      case api_result.Failure(:final error):
        emit(HomeState.error(message: error.apiErrorModel.message ?? ''));
        break;
    }
    if (specialties != null && doctors != null) {
      emit(HomeState.success(specialties, doctors));
    }
  }
}
