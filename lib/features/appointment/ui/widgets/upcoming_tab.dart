import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/features/appointment/data/models/appointment.dart';
import 'package:completed_flutter_projects/features/appointment/ui/widgets/upcoming_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpcomingTab extends StatelessWidget {
  const UpcomingTab({super.key, required this.upcomingAppointments});
  final List<Appointment> upcomingAppointments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          upcomingAppointments.isEmpty
              ? emptyAppointments()
              : ListView.builder(
                itemCount: upcomingAppointments.length,
                cacheExtent: 250,
                itemBuilder:
                    (context, index) =>
                        UpcomingCard(appointment: upcomingAppointments[index]),
              ),
    );
  }

  Widget emptyAppointments() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/booking.png',
            width: 200.w,
            height: 200.w,
            fit: BoxFit.contain,
          ),
          verticalSpace(5),
          Text(
            'No Upcoming Appointments',
            style: TextStyles.font17Black54SemiBold,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
