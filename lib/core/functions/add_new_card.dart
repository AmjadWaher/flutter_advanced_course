import 'package:completed_flutter_projects/core/helpers/constants.dart';
import 'package:completed_flutter_projects/core/helpers/shared_pref_helper.dart';
import 'package:completed_flutter_projects/core/helpers/top_message.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/features/book_appointment/logic/cubit/payment/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void addNewCard(BuildContext context) async {
  try {
    final userEmail = await SharedPrefHelper.getString(
      SharedPrefKeys.userEmail,
    );

    if (!context.mounted) return;
    final clientSecret = await context.read<PaymentCubit>().setupIntent();
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        setupIntentClientSecret: clientSecret,
        billingDetails: BillingDetails(
          email: userEmail,
          address: const Address(
            city: null,
            country: 'JO',
            line1: null,
            line2: null,
            postalCode: null,
            state: null,
          ),
        ),
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

    if (!context.mounted) return;
    showTopMessage(
      context: context,
      title: 'Success',
      content: 'Card added successfully',
    );
  } on StripeException catch (e) {
    if (e.error.code == FailureCode.Canceled) return;

    if (!context.mounted) return;

    showTopMessage(
      context: context,
      title: 'Error',
      content: e.error.message ?? 'Payment failed',
      isSuccess: false,
    );
  } catch (e) {
    if (!context.mounted) return;
    showTopMessage(
      context: context,
      title: 'Error',
      content: 'Something went wrong',
      isSuccess: false,
    );
  }
}
