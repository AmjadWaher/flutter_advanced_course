import 'package:completed_flutter_projects/core/helpers/extensions.dart';
import 'package:completed_flutter_projects/core/routing/routes.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/features/home/data/models/specialty_response.dart';
import 'package:flutter/material.dart';

class DoctorSpecialitySeeAllText extends StatelessWidget {
  const DoctorSpecialitySeeAllText({super.key,required this.specialtyList});
  final List<Specialty> specialtyList;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Doctor Speciality',
          style: TextStyles.font18DarkBlueSemiBold,
        ),
        Spacer(),
        TextButton(
          onPressed: () {
            context.pushNamed(Routes.doctorSpecialtyScreen,arguments: specialtyList);
          },
          child: Text(
            'See All',
            style: TextStyles.font12MainBlueRegular,
          ),
        ),
      ],
    );
  }
}
