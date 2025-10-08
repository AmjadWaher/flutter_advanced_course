// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:completed_flutter_projects/core/helpers/extensions.dart';
import 'package:completed_flutter_projects/core/routing/routes.dart';
import 'package:completed_flutter_projects/features/home/data/models/doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:completed_flutter_projects/features/home/data/models/specialty_response.dart';
import 'package:completed_flutter_projects/core/widgets/speciality_card.dart';

class DoctorSpecialityListView extends StatelessWidget {
  const DoctorSpecialityListView({
    super.key,
    required this.specialties,
    required this.doctors,
  });
  final List<Specialty> specialties;
  final List<Doctor> doctors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: specialties.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final specialty = specialties[index];
          return Padding(
            padding: EdgeInsetsDirectional.only(end: index == 4 ? 0 : 12.w),
            child: SpecialityCard(
              specialtyModel: specialty,
              onTap:
                  () => context.pushNamed(
                    Routes.allDoctorsScreen,
                    arguments: {
                      'doctorsList': doctors,
                      'specialtiesList': specialties,
                      'specialty': specialty,
                    },
                  ),
            ),
          );
        },
      ),
    );
  }
}
