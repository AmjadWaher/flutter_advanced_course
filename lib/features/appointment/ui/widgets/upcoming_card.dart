import 'package:cached_network_image/cached_network_image.dart';
import 'package:completed_flutter_projects/core/helpers/extensions.dart';
import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/features/appointment/data/models/appointment.dart';
import 'package:completed_flutter_projects/features/appointment/logic/cubit/appointment_cubit.dart';
import 'package:completed_flutter_projects/features/appointment/ui/screens/reschedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class UpcomingCard extends StatelessWidget {
  const UpcomingCard({super.key, required this.appointment});
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
          //Bottom shadow
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
            _buildDoctorInfo(
              doctorName: appointment.doctorName,
              doctorImageUrl: appointment.doctorImageUrl,
              doctorSpecailty: appointment.doctorSpecialty,
              dateTime: _formattedDateTime,
            ),
            verticalSpace(16),
            Divider(height: 1.h),
            verticalSpace(16),
            _buildCancelAndRescheduleButtons(
              onTapCancel: () {
                _showCancelSheet(context);
              },
              onTapReschedule: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:
                        (_) => BlocProvider.value(
                          value: context.read<AppointmentCubit>(),
                          child: RescheduleScreen(appointment: appointment),
                        ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showCancelSheet(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (_) {
        return Center(
          child: Container(
            height: 190.h,
            width: 250.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(50),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
                BoxShadow(
                  color: Colors.black.withAlpha(50),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Cancel Appointment?',
                  style: TextStyles.font18Black87Bold,
                ),
                verticalSpace(12),
                Text(
                  'Are you sure you want to cancel this appointment?',
                  style: TextStyles.font16Black54Regular,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                      ),
                      child: Text('No', style: TextStyles.font14BlackRegular),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.pop();
                        context.read<AppointmentCubit>().emitCancelAppointment(
                          appointment.id,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.coralRed,
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyles.font14WhiteRegular,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCancelAndRescheduleButtons({
    required void Function() onTapCancel,
    required void Function() onTapReschedule,
  }) {
    return Row(
      children: [
        OutlinedButton(
          onPressed: onTapCancel,
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            side: const BorderSide(color: AppColors.mainBlue),
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 18.w),
          ),
          child: Text(
            'Cancel Appointment',
            style: TextStyles.font12MainBlueSemiBold,
          ),
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: onTapReschedule,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.mainBlue,
            padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 10.h),
            elevation: 0,
          ),
          child: Text('Reschedule', style: TextStyles.font12WhiteSemiBold),
        ),
      ],
    );
  }

  Widget _buildDoctorInfo({
    required String doctorName,
    required String doctorImageUrl,
    required String doctorSpecailty,
    required String dateTime,
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
            Text(doctorSpecailty, style: TextStyles.font12GrayMedium),
            Text(dateTime, style: TextStyles.font12GrayMedium),
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
