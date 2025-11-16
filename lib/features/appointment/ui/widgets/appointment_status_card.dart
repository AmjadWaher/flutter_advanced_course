import 'package:cached_network_image/cached_network_image.dart';
import 'package:completed_flutter_projects/core/helpers/extensions.dart';
import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/features/appointment/data/models/appointment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AppointmentStatusCard extends StatelessWidget {
  const AppointmentStatusCard({super.key, required this.appointment});
  final Appointment appointment;

  String _formatDate(DateTime appointmentDate) {
    return DateFormat('EE, dd MMMM').format(appointmentDate);
  }

  String get _formattedDateTime =>
      '${_formatDate(appointment.date)} | ${appointment.time.formatTimeTo12Hour()}';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusGeometry.circular(12),
        boxShadow: [
          // Top shadow
          BoxShadow(
            color: Colors.black.withAlpha(10),
            offset: const Offset(0, -2),
            blurRadius: 10,
          ),
          // Bottom shadow
          BoxShadow(
            color: Colors.black.withAlpha(10),
            offset: const Offset(0, 4),
            blurRadius: 12,
          ),
        ],
      ),

      margin: EdgeInsets.symmetric(vertical: 6.h),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              appointment.status == AppointmentStatus.Completed
                  ? 'Appointment done'
                  : 'Appointment cancelled',
              style:
                  appointment.status == AppointmentStatus.Completed
                      ? TextStyles.font12LimeGreenRegular
                      : TextStyles.font12CoralRedRegular,
            ),
            verticalSpace(10),
            Text(_formattedDateTime),
            verticalSpace(16),
            Divider(height: 1.h, color: Colors.grey[200]),
            verticalSpace(16),
            _buildDoctorInfo(
              doctorName: appointment.doctorName,
              doctorImageUrl: appointment.doctorImageUrl,
              doctorSpecailty: appointment.doctorSpecialty,
              doctorClinic: appointment.doctorClinic,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorInfo({
    required String doctorName,
    required String doctorImageUrl,
    required String doctorSpecailty,
    required String doctorClinic,
  }) {
    return Row(
      children: [
        _doctorImage(imageUrl: doctorImageUrl),
        horizontalSpace(16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doctorName.capitalizeEachWord(),
              style: TextStyles.font16DarkBlueBold,
            ),
            verticalSpace(5),
            Text(doctorSpecailty, style: TextStyles.font12GrayMedium),
            verticalSpace(5),
            Text(doctorClinic, style: TextStyles.font12GrayMedium),
          ],
        ),
      ],
    );
  }

  Widget _doctorImage({required String imageUrl}) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(12),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: 80.h,
        width: 80.w,
        fit: BoxFit.cover,
        placeholder:
            (context, url) => Container(
              color: Colors.grey[200],
              child: const Icon(Icons.person, color: Colors.grey),
            ),
        errorWidget:
            (context, url, error) => Container(
              color: Colors.grey[200],
              child: const Icon(Icons.person, color: Colors.grey),
            ),
      ),
    );
  }
}
