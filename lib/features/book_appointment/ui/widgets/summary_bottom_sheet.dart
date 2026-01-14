import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/features/book_appointment/logic/cubit/booking/booking_cubit.dart';
import 'package:completed_flutter_projects/features/book_appointment/logic/cubit/booking/booking_state.dart';
import 'package:completed_flutter_projects/features/book_appointment/logic/cubit/payment/payment_cubit.dart';
import 'package:completed_flutter_projects/features/home/data/models/doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummaryBottomSheet extends StatelessWidget {
  const SummaryBottomSheet({super.key, required this.doctor});
  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 10.h,
          right: 24.w,
          left: 24.w,
          bottom: 35.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              indent: 140.w,
              endIndent: 140.w,
              color: AppColors.silverGray.withAlpha(51),
              thickness: 4.h,
            ),
            verticalSpace(8),
            Text('Payment Info', style: TextStyles.font14DarkBlueSemiBold),
            verticalSpace(15),
            _paymentInfoRow('Subtotal', doctor.appointPrice.toString()),
            verticalSpace(12),
            _paymentInfoRow('Tax', '0'),
            verticalSpace(16),
            _paymentInfoRow(
              'Payment Total',
              doctor.appointPrice.toString(),
              isBold: true,
            ),
            const Spacer(),
            _bookButton(
              onPressed: () async {
                final paymentMethod =
                    context.read<PaymentCubit>().state.paymentMethod;
                await context.read<BookingCubit>().submitBooking(
                  doctor.id,
                  doctor.appointPrice,
                  paymentMethod,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _paymentInfoRow(String label, String value, {bool isBold = false}) {
    return Row(
      children: [
        Text(
          label,
          style:
              isBold
                  ? TextStyles.font16DarkBlueSemiBold
                  : TextStyles.font14GrayRegular,
        ),
        const Spacer(),
        Text('\$$value', style: TextStyles.font16DarkBlueSemiBold),
      ],
    );
  }

  Widget _bookButton({required void Function() onPressed}) {
    return BlocSelector<BookingCubit, BookingState, bool>(
      selector: (state) {
        return state.isLoading;
      },
      builder: (context, state) {
        return ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(AppColors.mainBlue),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
            ),
            fixedSize: WidgetStateProperty.all<Size>(
              Size(double.maxFinite, 50.h),
            ),
          ),
          child:
              state
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text('Book Now', style: TextStyles.font16WhiteSemiBold),
        );
      },
    );
  }
}
