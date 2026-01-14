import 'package:completed_flutter_projects/core/helpers/extensions.dart';
import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/core/widgets/booking_details_card.dart';
import 'package:completed_flutter_projects/core/widgets/doctor_card.dart';
import 'package:completed_flutter_projects/features/book_appointment/logic/cubit/booking/booking_cubit.dart';
import 'package:completed_flutter_projects/features/book_appointment/logic/cubit/payment/payment_cubit.dart';
import 'package:completed_flutter_projects/features/book_appointment/ui/widgets/payment_method_tile.dart';
import 'package:completed_flutter_projects/features/home/data/models/doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key, required this.doctor});
  final Doctor doctor;

  String getFormattedDateAndTime(DateTime date, String timeString) {
    final formattedDate = DateFormat('EEEE, dd MMMM yyyy').format(date);
    final formattedTime = timeString.formatTimeTo12Hour();

    return '$formattedDate\n$formattedTime';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Booking Information', style: TextStyles.font15DarkBlueBold),
        verticalSpace(5),
        BookingDetailsCard(
          title: 'Date & Time',
          subtitle: getFormattedDateAndTime(
            context.read<BookingCubit>().state.selectedDate!,
            context.read<BookingCubit>().state.selectedTime!,
          ),
          icon: 'assets/svgs/calender.svg',
          color: AppColors.mainBlue,
        ),
        verticalSpace(18),
        Text('Doctor Information', style: TextStyles.font15DarkBlueBold),
        verticalSpace(8),
        DoctorCard(doctor: doctor, height: 80, width: 80, onTap: () {}),
        verticalSpace(18),
        Text('Payment Information', style: TextStyles.font15DarkBlueBold),
        verticalSpace(8),
        context.read<PaymentCubit>().state.paymentMethod == 'Cash'
            ? const PaymentMethodTile.cash()
            : PaymentMethodTile.card(
              card: context.read<PaymentCubit>().state.creditCard!,
            ),
      ],
    );
  }
}
