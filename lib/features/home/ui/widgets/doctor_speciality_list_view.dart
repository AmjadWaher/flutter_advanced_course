// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:completed_flutter_projects/features/home/data/models/specialty_response.dart';
import 'package:completed_flutter_projects/core/widgets/speciality_card.dart';

class DoctorSpecialityListView extends StatelessWidget {
  const DoctorSpecialityListView({
    super.key,
    required this.specialties,
  });
  final List<Specialty> specialties;

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
            ),
          );
        },
      ),
    );
  }
}
