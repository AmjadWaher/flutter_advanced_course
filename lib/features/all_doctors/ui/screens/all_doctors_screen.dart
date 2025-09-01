import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/core/widgets/app_top_bar.dart';
import 'package:completed_flutter_projects/core/widgets/filter_button.dart';
import 'package:completed_flutter_projects/features/all_doctors/logic/cubit/all_doctors_cubit.dart';
import 'package:completed_flutter_projects/features/all_doctors/logic/cubit/all_doctors_state.dart';
import 'package:completed_flutter_projects/features/all_doctors/ui/widgets/doctors_list_view.dart';
import 'package:completed_flutter_projects/features/all_doctors/ui/widgets/search_and_filter.dart';
import 'package:completed_flutter_projects/features/home/data/models/doctor.dart';
import 'package:completed_flutter_projects/features/home/data/models/specialty_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllDoctorsScreen extends StatelessWidget {
  const AllDoctorsScreen({
    super.key,
    required this.doctorsList,
    required this.specialtiesList,
  });
  final List<Doctor> doctorsList;
  final List<Specialty> specialtiesList;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AllDoctorsCubit(doctorsList)..emitAllDoctorsBySpecialtyId(-1),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const AppTopBar(title: 'All Doctors'),
              SearchAndFilter(
                specialtiesFilterList: [
                  SpecialtyFilterModel(id: -1, name: 'All'),
                  ...specialtiesList.map(
                    (specialty) => SpecialtyFilterModel(
                      id: specialty.id,
                      name: specialty.name,
                    ),
                  ),
                ],
              ),
              BlocBuilder<AllDoctorsCubit, AllDoctorsState>(
                builder: (context, state) {
                  switch (state) {
                    case Success():
                      if ((state.doctors as List).isEmpty) {
                        return Expanded(
                          child: Center(
                            child: Text(
                              'No doctors found',
                              style: TextStyles.font16BlackRegular,
                            ),
                          ),
                        );
                      } else {
                        return DoctorsListView(doctorsList: state.doctors);
                      }

                    default:
                      return Expanded(
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
