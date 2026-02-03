import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/features/book_appointment/logic/cubit/payment/payment_cubit.dart';
import 'package:completed_flutter_projects/features/book_appointment/logic/cubit/payment/payment_state.dart';
import 'package:completed_flutter_projects/features/book_appointment/ui/widgets/credit_card_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentMethodRadio extends StatelessWidget {
  const PaymentMethodRadio({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PaymentCubit, PaymentState, String>(
      selector: (state) => state.paymentMethod,
      builder: (ctx, state) {
        final cubit = ctx.read<PaymentCubit>();
        return RadioGroup<String>(
          onChanged: (value) async {
            cubit.selectPaymentMethod(value ?? '');
            if (value == 'Credit Card') {
              await _showCreditCardModal(context, cubit);
              if (cubit.state.creditCard == null) {
                cubit.selectPaymentMethod('Cash');
              }
            }
          },
          groupValue: state,
          child: Column(
            children: [
              RadioListTile(
                value: 'Cash',
                autofocus: true,
                activeColor: AppColors.mainBlue,
                title: Text('Cash', style: TextStyles.font14RichBlackSemiBold),
              ),
              RadioListTile(
                value: 'Credit Card',
                autofocus: true,
                activeColor: AppColors.mainBlue,
                title: Text(
                  'Credit Card',
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
    );
  }

  Future<void> _showCreditCardModal(
    BuildContext context,
    PaymentCubit cubit,
  ) async {
    await showModalBottomSheet(
      context: context,
      enableDrag: false,
      builder: (_) {
        context.read<PaymentCubit>().savedCards();
        return BlocProvider.value(value: cubit, child: const CreditCardModal());
      },
    );
  }
}
