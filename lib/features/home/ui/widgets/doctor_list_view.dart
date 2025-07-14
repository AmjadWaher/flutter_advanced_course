import 'package:completed_flutter_projects/features/home/data/models/doctor.dart';
import 'package:completed_flutter_projects/features/home/ui/widgets/doctor_card.dart';
import 'package:flutter/material.dart';

class DoctorListView extends StatelessWidget {
  const DoctorListView({super.key, required this.doctors});
  final List<Doctor> doctors;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return DoctorCard(
          doctor: doctors[index],
        );
      },
    );
  }
}
