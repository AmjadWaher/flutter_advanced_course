import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpecialityCard extends StatelessWidget {
  const SpecialityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsetsDirectional.symmetric(horizontal: 8.w, vertical: 5.h),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.zircon,
            radius: 36.r,
            child: SvgPicture.asset(
              'assets/svgs/general_speciality.svg',
              height: 35.h,
              width: 35.w,
            ),
          ),
          Spacer(),
          Text(
            'General',
            textAlign: TextAlign.center,
            style: TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
