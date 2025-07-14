import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:flutter/material.dart';

class DoctorSeeAllText extends StatelessWidget {
  const DoctorSeeAllText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Doctors',
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