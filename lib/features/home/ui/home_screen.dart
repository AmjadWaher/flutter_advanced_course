import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/features/home/ui/widgets/doctor_booking_card.dart';
import 'package:completed_flutter_projects/features/home/ui/widgets/home_top_bar.dart';
import 'package:completed_flutter_projects/features/home/ui/widgets/specializations_and_doctors_bloc_builder.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(16, 12.0, 16, 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeTopBar(),
                const DoctorBookingCard(),
                verticalSpace(10),
                SpecializationsAndDoctorsBlocBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
