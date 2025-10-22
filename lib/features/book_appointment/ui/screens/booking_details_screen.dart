import 'package:completed_flutter_projects/core/helpers/extensions.dart';
import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/core/widgets/app_text_button.dart';
import 'package:completed_flutter_projects/core/widgets/app_top_bar.dart';
import 'package:completed_flutter_projects/core/widgets/booking_details_card.dart';
import 'package:completed_flutter_projects/core/widgets/doctor_card.dart';
import 'package:completed_flutter_projects/features/book_appointment/logic/cubit/booking_state.dart';
import 'package:completed_flutter_projects/features/home/data/models/doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({
    super.key,
    required this.doctor,
    required this.bookingState,
  });
  final Doctor doctor;
  final BookingState bookingState;

  String getDateAndTime(DateTime date, String time) {
    final fulDate = DateFormat('EEEE, dd MMMM yyyy').format(date);

    return '$fulDate\n$time';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppTopBar(title: 'Details'),
            Container(
              padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 60.h),
              child: Column(
                children: [
                  Icon(
                    bookingState.isError
                        ? Icons.cancel_rounded
                        : Icons.check_circle_rounded,
                    size: 65.w,
                    color:
                        bookingState.isError ? Colors.red : AppColors.limeGreen,
                  ),
                  verticalSpace(30),
                  Text(
                    bookingState.isError
                        ? bookingState.errorMessage!
                        : 'Booking Confirmed',
                    style: TextStyles.font20DarkBlueMedium,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 24.w, left: 24.w, bottom: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Booking Information',
                      style: TextStyles.font15DarkBlueBold,
                    ),
                    verticalSpace(5),
                    BookingDetailsCard(
                      title: 'Date & Time',
                      subtitle: getDateAndTime(
                        bookingState.selectedDate!,
                        bookingState.selectedTime!,
                      ),
                      icon: 'assets/svgs/calender.svg',
                      color: AppColors.mainBlue,
                    ),
                    verticalSpace(18),
                    Text(
                      'Doctor Information',
                      style: TextStyles.font15DarkBlueBold,
                    ),
                    verticalSpace(8),
                    DoctorCard(
                      doctor: doctor,
                      height: 80,
                      width: 80,
                      onTap: () {},
                    ),
                    Spacer(),
                    AppTextButton(
                      buttonText: 'Done',
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        context.pop();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
