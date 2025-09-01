import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/features/home/data/models/clinic.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key,required this.clinic});
  final Clinic clinic;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Practice Place', style: TextStyles.font16DarkBlueSemiBold),
          verticalSpace(12),
          Text(
            clinic.address,
            style: TextStyles.font14DarkSilverRegular,
            maxLines: null,
          ),
          verticalSpace(24),
          Text('Location Map', style: TextStyles.font16DarkBlueSemiBold),
          verticalSpace(12),
          Image.asset('assets/images/map.png')
        ],
      ),
    );
  }
}
