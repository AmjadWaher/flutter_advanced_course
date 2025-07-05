import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorBookingCard extends StatelessWidget {
  const DoctorBookingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 197.h,
      width: double.infinity,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            height: 167.h,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              image: const DecorationImage(
                image: AssetImage('assets/images/home_blue_pattern.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Book and\nschedule with\nnearest doctor',
                  style: TextStyles.font18WhiteMedium.copyWith(
                    height: 1.6.h,
                  ),
                  textAlign: TextAlign.start,
                ),
                verticalSpace(16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(48.0),
                      ),
                    ),
                    child: Text(
                      'Find Nearby',
                      style: TextStyles.font12MainBlueRegular,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 14.w,
            child: Image.asset(
              'assets/images/nurse.png',
              height: 197.h,
            ),
          ),
        ],
      ),
    );
  }
}
