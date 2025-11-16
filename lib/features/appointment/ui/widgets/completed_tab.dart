import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/features/appointment/data/models/appointment.dart';
import 'package:completed_flutter_projects/features/appointment/ui/widgets/appointment_status_card.dart';
import 'package:flutter/material.dart';

class CompletedTab extends StatelessWidget {
  const CompletedTab({super.key, required this.completedAppointments});
  final List<Appointment> completedAppointments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          completedAppointments.isEmpty
              ? Center(
                child: Text(
                  'No completed appointments yet!',
                  style: TextStyles.font17Black54SemiBold,
                ),
              )
              : ListView.builder(
                itemCount: completedAppointments.length,
                cacheExtent: 250,
                itemBuilder:
                    (context, index) => AppointmentStatusCard(
                      appointment: completedAppointments[index],
                    ),
              ),
    );
  }
}
