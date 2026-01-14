import 'package:completed_flutter_projects/core/helpers/credit_card_icons.dart';
import 'package:completed_flutter_projects/core/helpers/extensions.dart';
import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/core/widgets/app_text_button.dart';
import 'package:completed_flutter_projects/features/book_appointment/data/models/credit_card.dart';
import 'package:completed_flutter_projects/features/book_appointment/logic/cubit/payment/payment_cubit.dart';
import 'package:completed_flutter_projects/features/book_appointment/logic/cubit/payment/payment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_svg/svg.dart';

class CreditCardModal extends StatelessWidget {
  const CreditCardModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
        top: 15.h,
        bottom: 20.h,
      ),
      child: Column(
        children: [
          _buildDragHandle(),
          verticalSpace(20),
          Expanded(child: _buildSavedCards()),
          verticalSpace(10),
          AppTextButton(
            buttonText: 'Add new card',
            textStyle: TextStyles.font12WhiteMedium,
            onPressed: () {
              _addNewCard(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSavedCards() {
    return BlocSelector<PaymentCubit, PaymentState, List<CreditCard>>(
      selector: (state) {
        return state.savedCards;
      },
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return _buildCardPayment(context, state[index]);
          },
        );
      },
    );
  }

  Widget _buildCardPayment(BuildContext context, CreditCard card) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h),
      child: ListTile(
        leading: SvgPicture.asset(
          CreditCardIcons.getIcon(card.brand),
          fit: BoxFit.cover,
          width: 35.w,
          height: 35.w,
        ),
        title: Text(card.brand, style: TextStyles.font14DarkBlueMedium),
        subtitle: Text(
          card.brand == 'amex'
              ? '**** ****** *${card.last4}'
              : '**** **** **** ${card.last4}',
          style: TextStyles.font11GreyReqular,
        ),
        onTap: () {
          context.read<PaymentCubit>().selectCardToPayment(card);
          context.pop();
        },
      ),
    );
  }

  void _addNewCard(BuildContext context) async {
    try {
      final clientSecret = await context.read<PaymentCubit>().setupIntent();
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          setupIntentClientSecret: clientSecret,
          billingDetails: const BillingDetails(email: 'amjad5@gmail.com'),
          merchantDisplayName: 'Doc App',
          style: ThemeMode.light,
          appearance: PaymentSheetAppearance(
            colors: PaymentSheetAppearanceColors(
              primary: AppColors.mainBlue,
              background: Colors.white,
              componentBackground: Colors.white,
              componentBorder: Colors.grey.shade300,
              componentDivider: Colors.grey.shade200,
              primaryText: Colors.black,
              secondaryText: Colors.grey,
              componentText: Colors.black,
              placeholderText: Colors.black,
            ),
            shapes: const PaymentSheetShape(borderRadius: 12, borderWidth: 1),
          ),
        ),
      );

      await Stripe.instance.presentPaymentSheet();
    } on StripeException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.error.message ?? 'Payment cancelled')),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Something went wrong')));
    }
  }

  Widget _buildDragHandle() {
    return SizedBox(
      width: 20.w,
      height: 3.h,
      child: Divider(
        height: 3,
        thickness: 3,
        radius: BorderRadius.circular(16),
      ),
    );
  }
}
