import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/core/widgets/doctor_card.dart';
import 'package:completed_flutter_projects/features/appointment/logic/cubit/booking_cubit.dart';
import 'package:completed_flutter_projects/features/home/data/models/doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key, required this.doctor});
  final Doctor doctor;

  String getDateAndTime(DateTime date, String time) {
    final fulDate = DateFormat('EEEE, dd MMMM yyyy').format(date);

    return '$fulDate\n$time';
  }

  @override
  Widget build(BuildContext context) {
    final state = context.read<BookingCubit>().state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Booking Information', style: TextStyles.font15DarkBlueBold),
        verticalSpace(5),
        _bookingDetailsCard(
          title: 'Date & Time',
          subtitle: getDateAndTime(state.selectedDate!, state.selectedTime!),
          icon: 'assets/svgs/calender.svg',
          color: AppColors.mainBlue,
        ),
        verticalSpace(18),
        Text('Doctor Information', style: TextStyles.font15DarkBlueBold),
        verticalSpace(8),
        DoctorCard(doctor: doctor, height: 80, width: 80, onTap: () {}),
      ],
    );
  }

  Widget _bookingDetailsCard({
    required String title,
    required String subtitle,
    required String icon,
    required Color color,
  }) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: color.withAlpha(30),
        ),
        padding: EdgeInsets.all(8.w),
        child: SvgPicture.asset(
          icon,
          height: 24.h,
          width: 24.w,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        ),
      ),
      title: Text(title, style: TextStyles.font14DarkBlueBold),
      subtitle: Text(subtitle, style: TextStyles.font12GrayRegular),
    );
  }
}
