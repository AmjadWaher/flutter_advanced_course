import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/features/book_appointment/logic/cubit/booking_cubit.dart';
import 'package:completed_flutter_projects/features/book_appointment/logic/cubit/booking_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payment Option', style: TextStyles.font16RichBlackSemiBold),
        verticalSpace(12),
        BlocSelector<BookingCubit, BookingState, String>(
          selector: (state) => state.paymentMethod,
          builder: (context, state) {
            final cubit = context.read<BookingCubit>();
            return RadioGroup<String>(
              onChanged: (value) {
                cubit.selectPayment(value!);
              },
              groupValue: state,
              child: Column(
                children: [
                  RadioListTile(
                    value: 'Cash',
                    autofocus: true,
                    activeColor: AppColors.mainBlue,
                    title: Text(
                      'Cash',
                      style: TextStyles.font14RichBlackSemiBold,
                    ),
                  ),
                  RadioListTile(
                    value: 'PayPal',
                    activeColor: AppColors.mainBlue,
                    title: Text(
                      'PayPal',
                      style: TextStyles.font14RichBlackSemiBold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
