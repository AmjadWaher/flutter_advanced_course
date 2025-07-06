import 'package:completed_flutter_projects/features/home/ui/widgets/doctor_card.dart';
import 'package:flutter/material.dart';

class RecommendationDoctorListView extends StatelessWidget {
  const RecommendationDoctorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return DoctorCard();
      },
    );
  }
}
