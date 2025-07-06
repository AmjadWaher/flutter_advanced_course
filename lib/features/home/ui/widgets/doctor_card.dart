import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 2.w, vertical: 5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/male_doctor.png',
              height: 110.h,
              width: 110.w,
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dr. Randy Wigham',
                  style: TextStyles.font16DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(10),
                Text(
                  'General | RSUD Gatot Subroto',
                  style: TextStyles.font12GrayMedium,
                ),
                verticalSpace(10),
                Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: AppColors.rubberDuckyYellow,
                      size: 13,
                    ),
                    horizontalSpace(2),
                    Text(
                      '4.8',
                      style: TextStyles.font12GrayMedium,
                    ),
                    horizontalSpace(2),
                    Text(
                      '(4,279 reviews)',
                      style: TextStyles.font12GrayMedium,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
