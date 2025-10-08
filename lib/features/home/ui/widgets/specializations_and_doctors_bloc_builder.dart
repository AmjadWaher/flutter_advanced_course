import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/features/home/logic/home_cubit.dart';
import 'package:completed_flutter_projects/features/home/logic/home_state.dart';
import 'package:completed_flutter_projects/features/home/ui/widgets/doctor_list_view.dart';
import 'package:completed_flutter_projects/features/home/ui/widgets/doctor_see_all_text.dart';
import 'package:completed_flutter_projects/features/home/ui/widgets/doctor_speciality_list_view.dart';
import 'package:completed_flutter_projects/features/home/ui/widgets/doctor_speciality_see_all_text.dart';
import 'package:completed_flutter_projects/features/home/ui/widgets/home_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationsAndDoctorsBlocBuilder extends StatelessWidget {
  const SpecializationsAndDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is Error || current is Success || current is Loading,
      builder: (context, state) {
        switch (state) {
          case Error():
            return Center(
              child: Text(state.message),
            );

          case Success():
            return setupSuccess(state);

          default:
            return setupLoading();
        }
      },
    );
  }

  Widget setupLoading() {
    return HomeShimmer();
  }

  Widget setupSuccess(Success state) {
    return Column(
      children: [
        DoctorSpecialitySeeAllText(specialtyList: state.specialtyData, doctorsList: state.doctorData),
        DoctorSpecialityListView(specialties: state.specialtyData,doctors: state.doctorData,),
        verticalSpace(10),
        DoctorSeeAllText(
          doctorsList: state.doctorData,
          specialtyList: state.specialtyData,
        ),
        DoctorListView(doctors: state.doctorData),
      ],
    );
  }
}
