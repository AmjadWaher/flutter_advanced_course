import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int pageIndex;
  final Function(int index) onTap;
  const CustomBottomNavigationBar({
    super.key,
    required this.pageIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      padding: EdgeInsets.only(right: 15.w, left: 15.w),
      elevation: 0.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _navigationItem(
            icon: 'assets/svgs/home.svg',
            selected: pageIndex == 0,
            onTap: () => onTap(0),
          ),
          _navigationItem(
            icon: 'assets/svgs/message.svg',
            selected: pageIndex == 1,
            onTap: () => onTap(1),
          ),
          horizontalSpace(20),
          _navigationItem(
            icon: 'assets/svgs/calender.svg',
            selected: pageIndex == 2,
            onTap: () => onTap(2),
          ),
          _navigationProfile(
            onTap: () => onTap(3),
          ),
        ],
      ),
    );
  }

  Widget _navigationItem({
    required String icon,
    required bool selected,
    required Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
          selected ? AppColors.mainBlue : AppColors.darkBlue,
          BlendMode.srcIn,
        ),
      ),
    );
  }

  Widget _navigationProfile({required Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        height: 27.h,
        width: 27.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          image: DecorationImage(
            image: AssetImage(
              'assets/images/male_face_avatar.png',
            ),
          ),
        ),
      ),
    );
  }
}
