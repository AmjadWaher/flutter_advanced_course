import 'package:completed_flutter_projects/features/home/data/models/doctor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:completed_flutter_projects/features/all_doctors/logic/cubit/all_doctors_state.dart';

class AllDoctorsCubit extends Cubit<AllDoctorsState> {
  final List<Doctor> _allDoctorsList;
  AllDoctorsCubit(this._allDoctorsList)
    : super(const AllDoctorsState.initial());

  void emitAllDoctorsBySpecialtyId(int specialtyId) async {
    emit(const AllDoctorsState.loading());

    if (specialtyId == -1) {
      emit(AllDoctorsState.success(_allDoctorsList));
      return;
    } else {
      emit(
        AllDoctorsState.success(
          _allDoctorsList
              .where((doctor) => doctor.specialization.id == specialtyId)
              .toList(),
        ),
      );
    }
  }

  void emitSearchedDoctors(String value, {int? specialtyId}) {
    emit(const AllDoctorsState.loading());

    List<Doctor> filtered = _allDoctorsList;

    if (value.isNotEmpty) {
      filtered =
          filtered
              .where(
                (doctor) =>
                    doctor.username.toLowerCase().contains(value.toLowerCase()),
              )
              .toList();
    }

    if (specialtyId != null) {
      filtered =
          filtered
              .where((doctor) => doctor.specialization.id == specialtyId)
              .toList();
    }

    emit(AllDoctorsState.success(filtered));
  }
}
