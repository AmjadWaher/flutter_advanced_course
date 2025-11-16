import 'package:completed_flutter_projects/core/helpers/extensions.dart';
import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/features/home/data/models/doctor.dart';
import 'package:flutter/material.dart';

class AboutDoctorScreen extends StatelessWidget {
  const AboutDoctorScreen({super.key, required this.doctor});
  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('About me', style: TextStyles.font16DarkBlueSemiBold),
          verticalSpace(12),
          Text(
            doctor.description,
            style: TextStyles.font14DarkSilverRegular,
            maxLines: null,
          ),
          verticalSpace(24),
          Text('Working Time', style: TextStyles.font16DarkBlueSemiBold),
          verticalSpace(12),
          Text(
            '${doctor.workDays}, ${doctor.startTime.formatTimeTo12Hour()} - ${doctor.endTime.formatTimeTo12Hour()}',
            style: TextStyles.font14DarkSilverRegular,
          ),
        ],
      ),
    );
  }
}
