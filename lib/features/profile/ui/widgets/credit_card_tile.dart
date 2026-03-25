import 'package:completed_flutter_projects/core/helpers/credit_card_icons.dart';
import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/features/book_appointment/data/models/credit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreditCardTile extends StatelessWidget {
  const CreditCardTile({
    super.key,
    required this.card,
    required this.onPressed,
  });
  final CreditCard card;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 14.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.black.withAlpha(5),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            CreditCardIcons.getIcon(card.brand),
            fit: BoxFit.cover,
            width: 40.w,
            height: 40.w,
          ),
          horizontalSpace(14),
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
          const Spacer(),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.delete),
            color: AppColors.coralRed,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
