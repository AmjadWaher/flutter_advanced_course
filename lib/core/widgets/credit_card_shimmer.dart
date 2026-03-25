import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CreditCardShimmer extends StatelessWidget {
  const CreditCardShimmer({
    super.key,
    this.iconHeight,
    this.iconWidth,
    this.titleHeight,
    this.titleWidth,
    this.numberHeight,
    this.numberWidth,
  });

  final double? iconHeight;
  final double? iconWidth;
  final double? titleHeight;
  final double? titleWidth;
  final double? numberHeight;
  final double? numberWidth;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.grey.shade400,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: (iconHeight ?? 25).h,
                  width: (iconWidth ?? 40).w,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                horizontalSpace(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: (titleHeight ?? 8).h,
                      width: (titleWidth ?? 50).w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                    ),
                    verticalSpace(10),
                    Container(
                      height: (numberHeight ?? 5).h,
                      width: (numberWidth ?? 110).w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
