import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/features/appointment/data/models/appointment.dart';
import 'package:completed_flutter_projects/features/appointment/ui/widgets/appointment_status_card.dart';
import 'package:flutter/material.dart';

class CancelledTab extends StatelessWidget {
  const CancelledTab({super.key, required this.cancelledAppointments});
  final List<Appointment> cancelledAppointments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          cancelledAppointments.isEmpty
              ? Center(
                child: Text(
                  'No cancelled appointments',
                  style: TextStyles.font17Black54SemiBold,
                ),
              )
              : ListView.builder(
                itemCount: cancelledAppointments.length,
                cacheExtent: 250,
                itemBuilder:
                    (context, index) => AppointmentStatusCard(
                      appointment: cancelledAppointments[index],
                    ),
              ),
    );
  }
}
