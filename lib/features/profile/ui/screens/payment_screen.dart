import 'package:completed_flutter_projects/core/functions/add_new_card.dart';
import 'package:completed_flutter_projects/core/functions/app_dialog.dart';
import 'package:completed_flutter_projects/core/helpers/extensions.dart';
import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/widgets/app_elevated_button.dart';
import 'package:completed_flutter_projects/core/widgets/app_top_bar.dart';
import 'package:completed_flutter_projects/features/book_appointment/logic/cubit/payment/payment_cubit.dart';
import 'package:completed_flutter_projects/features/book_appointment/logic/cubit/payment/payment_state.dart';
import 'package:completed_flutter_projects/features/profile/ui/widgets/credit_card_tile.dart';
import 'package:completed_flutter_projects/features/profile/ui/widgets/list_cards_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<PaymentCubit, PaymentState>(
          buildWhen:
              (previous, current) =>
                  current.isLoading || current.isSuccess || current.isError,
          builder: (context, state) {
            final cards = state.savedCards;
            if (state.isLoading) {
              return const ListCardsShimmer();
            }
            if (state.isError) {
              return Center(
                child: Text(state.errorMessage ?? 'Something went wrong'),
              );
            }
            return Column(
              children: [
                const AppTopBar(title: 'Payment'),
                verticalSpace(5),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      return CreditCardTile(
                        card: cards[index],
                        onPressed: () {
                          deleteCard(context, cards[index].id);
                        },
                      );
                    },
                    separatorBuilder: (context, index) => verticalSpace(10),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 16.h,
                  ),
                  child: AppElevatedButton(
                    title: 'Add Card',
                    isLoading: state.isLoading,
                    onPressed: () {
                      addNewCard(context);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void deleteCard(BuildContext context, String cardId) {
    appDialog(
      context,
      acceptButtonOnPressed: () {
        context.read<PaymentCubit>().deleteCard(cardId);
        context.pop();
      },
      rejectButtonOnPressed: () {
        context.pop();
      },
      title: 'Delete Card',
      content: 'Are you sure you want to delete this card?',
    );
  }
}
