import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:flutter/material.dart';

class DoctorSpecialitySeeAllText extends StatelessWidget {
  const DoctorSpecialitySeeAllText({super.key});

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
          onPressed: () {},
          child: Text(
            'See All',
            style: TextStyles.font12MainBlueRegular,
          ),
        ),
      ],
    );
  }
}
