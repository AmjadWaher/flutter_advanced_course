import 'package:completed_flutter_projects/core/helpers/extensions.dart';
import 'package:completed_flutter_projects/core/routing/routes.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/features/home/data/models/doctor.dart';
import 'package:completed_flutter_projects/features/home/data/models/specialty_response.dart';
import 'package:flutter/material.dart';

class DoctorSeeAllText extends StatelessWidget {
  const DoctorSeeAllText({
    super.key,
    required this.doctorsList,
    required this.specialtyList,
  });
  final List<Doctor> doctorsList;
  final List<Specialty> specialtyList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text('Doctors', style: TextStyles.font18DarkBlueSemiBold),
          const Spacer(),
          TextButton(
            onPressed: () {
              context.pushNamed(
                Routes.allDoctorsScreen,
                arguments: {
                  'doctorsList': doctorsList,
                  'specialtiesList': specialtyList,
                },
              );
            },
            child: Text('See All', style: TextStyles.font12MainBlueRegular),
          ),
        ],
      ),
    );
  }
}
