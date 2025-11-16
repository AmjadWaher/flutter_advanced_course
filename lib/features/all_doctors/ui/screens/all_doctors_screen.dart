import 'package:completed_flutter_projects/core/helpers/spacing.dart';
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
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllDoctorsScreen extends StatelessWidget {
  const AllDoctorsScreen({
    super.key,
    required this.doctorsList,
    required this.specialtiesList,
    this.specialty,
  });
  final List<Doctor> doctorsList;
  final List<Specialty> specialtiesList;
  final Specialty? specialty;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => AllDoctorsCubit(doctorsList)
            ..emitAllDoctorsBySpecialtyId(
              specialty == null ? -1 : specialty!.id,
            ),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              AppTopBar(
                title: specialty == null ? 'All Doctors' : specialty!.name,
              ),
              SearchAndFilter(
                specialty: specialty,
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
                        return Expanded(child: emptyStateView());
                      } else {
                        return DoctorsListView(doctorsList: state.doctors);
                      }

                    default:
                      return Expanded(
                        child: const Center(child: CircularProgressIndicator()),
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

  Widget emptyStateView() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/medicine.png',
              width: 200.w,
              height: 200.w,
              fit: BoxFit.contain,
            ),
            verticalSpace(24),
            Text(
              'No Doctors Found',
              style: TextStyles.font17Black87Bold,
              textAlign: TextAlign.center,
            ),
            verticalSpace(10),
            Text(
              'There are no doctors available in this specialty right now.',
              style: TextStyles.font14Grey600Regular,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
