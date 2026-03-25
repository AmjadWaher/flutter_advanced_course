import 'package:completed_flutter_projects/core/functions/add_new_card.dart';
import 'package:completed_flutter_projects/core/helpers/credit_card_icons.dart';
import 'package:completed_flutter_projects/core/helpers/extensions.dart';
import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/core/widgets/app_text_button.dart';
import 'package:completed_flutter_projects/features/book_appointment/data/models/credit_card.dart';
import 'package:completed_flutter_projects/features/book_appointment/logic/cubit/payment/payment_cubit.dart';
import 'package:completed_flutter_projects/features/book_appointment/logic/cubit/payment/payment_state.dart';
import 'package:completed_flutter_projects/core/widgets/credit_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            textStyle: TextStyles.font16WhiteMedium,
            onPressed: () {
              addNewCard(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSavedCards() {
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) {
        if (state.isLoading) {
          return ListView.separated(
            itemCount: 4,
            itemBuilder: (context, index) => const CreditCardShimmer(),
            separatorBuilder: (_, _) => verticalSpace(12),
          );
        }
        if (state.savedCards.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'No payment methods found.',
                style: TextStyles.font14DarkBlueMedium,
              ),
              verticalSpace(5),
              Text(
                'Please add a card to complete your booking.',
                style: TextStyles.font13DarkBlueMedium,
              ),
            ],
          );
        }
        return ListView.builder(
          itemCount: state.savedCards.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return _buildCardPayment(context, state.savedCards[index]);
          },
        );
      },
    );
  }

  Widget _buildCardPayment(BuildContext context, CreditCard card) {
    return InkWell(
      onTap: () {
        context.read<PaymentCubit>().selectCardToPayment(card);
        context.pop();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
        child: Row(
          children: [
            SvgPicture.asset(
              CreditCardIcons.getIcon(card.brand),
              fit: BoxFit.cover,
              width: 40.w,
              height: 40.w,
            ),
            horizontalSpace(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(card.brand, style: TextStyles.font15DarkBlueMedium),
                verticalSpace(8),
                Text(
                  card.brand == 'amex'
                      ? '**** ****** *${card.last4}'
                      : '**** **** **** ${card.last4}',
                  style: TextStyles.font12Grey900Regular,
                ),
              ],
            ),
          ],
        ),
      ),
    );
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
