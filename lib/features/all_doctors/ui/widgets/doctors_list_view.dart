import 'package:completed_flutter_projects/core/widgets/doctor_card.dart';
import 'package:completed_flutter_projects/features/home/data/models/doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key, required this.doctorsList});
  final List<Doctor> doctorsList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: doctorsList.length,
          itemBuilder: (context, index) {
            return DoctorCard(
              doctor: doctorsList[index],
              color: Colors.white,
              elevation: 1.5,
            );
          },
        ),
      ),
    );
  }
}
