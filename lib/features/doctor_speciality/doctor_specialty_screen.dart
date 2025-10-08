import 'package:completed_flutter_projects/core/helpers/extensions.dart';
import 'package:completed_flutter_projects/core/routing/routes.dart';
import 'package:completed_flutter_projects/core/widgets/app_top_bar.dart';
import 'package:completed_flutter_projects/core/widgets/speciality_card.dart';
import 'package:completed_flutter_projects/features/home/data/models/doctor.dart';
import 'package:completed_flutter_projects/features/home/data/models/specialty_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialtyScreen extends StatelessWidget {
  const DoctorSpecialtyScreen({
    super.key,
    required this.specialtyList,
    required this.doctorsList,
  });
  final List<Specialty> specialtyList;
  final List<Doctor> doctorsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppTopBar(title: 'Doctor Speciality'),
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
                  onTap:
                      () => context.pushNamed(
                        Routes.allDoctorsScreen,
                        arguments: {
                          'doctorsList': doctorsList,
                          'specialtiesList': specialtyList,
                          'specialty': specialtyList[index],
                        },
                      ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
