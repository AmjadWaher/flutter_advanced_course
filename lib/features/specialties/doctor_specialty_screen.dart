import 'package:completed_flutter_projects/core/widgets/speciality_card.dart';
import 'package:completed_flutter_projects/features/home/data/models/specialty_response.dart';
import 'package:completed_flutter_projects/features/specialties/widgets/doctor_specialty_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialtyScreen extends StatelessWidget {
  const DoctorSpecialtyScreen({super.key, required this.specialtyList});
  final List<Specialty> specialtyList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const DoctorSpecialtyTopBar(),
            GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
              shrinkWrap: true,
              itemCount: specialtyList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 0.8.w,
                mainAxisSpacing: 30.h,
              ),
              itemBuilder: (context, index) {
                return SpecialityCard(
                  specialtyModel: specialtyList[index],
                  height: 35,
                  width: 25,
                  radius: 36,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
