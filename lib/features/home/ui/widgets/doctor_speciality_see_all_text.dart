import 'package:completed_flutter_projects/core/helpers/extensions.dart';
import 'package:completed_flutter_projects/core/routing/routes.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/features/home/data/models/doctor.dart';
import 'package:completed_flutter_projects/features/home/data/models/specialty_response.dart';
import 'package:flutter/material.dart';

class DoctorSpecialitySeeAllText extends StatelessWidget {
  const DoctorSpecialitySeeAllText({
    super.key,
    required this.specialtyList,
    required this.doctorsList,
  });
  final List<Specialty> specialtyList;
  final List<Doctor> doctorsList;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Doctor Speciality', style: TextStyles.font18DarkBlueSemiBold),
        const Spacer(),
        TextButton(
          onPressed: () {
            context.pushNamed(
              Routes.doctorSpecialtyScreen,
              arguments: {
                'specialtiesList': specialtyList,
                'doctorsList': doctorsList,
              },
            );
          },
          child: Text('See All', style: TextStyles.font12MainBlueRegular),
        ),
      ],
    );
  }
}
