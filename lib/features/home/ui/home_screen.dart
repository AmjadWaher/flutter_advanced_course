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
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 5, 16, 0.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate(const [
                  HomeTopBar(),
                  DoctorBookingCard(),
                ]),
              ),
            ),
            const SpecializationsAndDoctorsBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
