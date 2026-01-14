import 'package:completed_flutter_projects/core/helpers/credit_card_icons.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/features/book_appointment/data/models/credit_card.dart';
import 'package:completed_flutter_projects/features/book_appointment/logic/enums/card_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethodTile extends StatelessWidget {
  const PaymentMethodTile.cash({super.key}) : isCash = true, card = null;
  const PaymentMethodTile.card({super.key, required CreditCard this.card})
    : isCash = false;
  final CreditCard? card;
  final bool isCash;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mediumSeashell,
        ),
        padding: const EdgeInsets.all(6),
        child: SvgPicture.asset(
          CreditCardIcons.getIcon(isCash ? 'cash' : '${card?.brand}'),
          height: 40,
          width: 40,
        ),
      ),
      title: Text(
        isCash ? 'Cash' : '${card?.brand}',
        style: TextStyles.font16DarkBlueMedium,
      ),
      subtitle:
          isCash
              ? null
              : Text(
                card?.brand == CardType.amex.name
                    ? '**** ******* *${card?.last4}'
                    : '**** **** **** ${card?.last4}',
                style: TextStyles.font11DarkBlueReqular,
              ),
    );
  }
}
