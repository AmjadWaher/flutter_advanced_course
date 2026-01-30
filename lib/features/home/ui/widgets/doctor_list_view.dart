import 'package:completed_flutter_projects/features/home/data/models/doctor.dart';
import 'package:completed_flutter_projects/core/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorListView extends StatelessWidget {
  const DoctorListView({super.key, required this.doctors});
  final List<Doctor> doctors;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 2.h),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return DoctorCard(doctor: doctors[index]);
        }, childCount: doctors.length),
      ),
    );
  }
}
