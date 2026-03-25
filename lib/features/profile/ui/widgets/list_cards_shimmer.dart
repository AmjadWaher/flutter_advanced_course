import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/widgets/credit_card_shimmer.dart';
import 'package:completed_flutter_projects/features/profile/ui/widgets/add_card_button_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListCardsShimmer extends StatelessWidget {
  const ListCardsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemBuilder:
                (context, index) => const CreditCardShimmer(
                  iconHeight: 40,
                  iconWidth: 40,
                  titleHeight: 7,
                  titleWidth: 60,
                  numberHeight: 5,
                  numberWidth: 120,
                ),
            separatorBuilder: (context, index) => verticalSpace(12),
            itemCount: 5,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: const AddCardButtonShimmer(),
        ),
      ],
    );
  }
}
