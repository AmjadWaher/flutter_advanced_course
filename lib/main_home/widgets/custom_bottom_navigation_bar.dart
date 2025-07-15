import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            icon: Icons.home_outlined,
            selected: pageIndex == 0,
            onTap: () => onTap(0),
          ),
          _navigationItem(
            icon: Icons.message_outlined,
            selected: pageIndex == 1,
            onTap: () => onTap(1),
          ),
          horizontalSpace(20),
          _navigationItem(
            icon: Icons.calendar_month_outlined,
            selected: pageIndex == 2,
            onTap: () => onTap(2),
          ),
          _navigationItem(
            icon: Icons.person_outline,
            selected: pageIndex == 3,
            onTap: () => onTap(3),
          ),
        ],
      ),
    );
  }

  Widget _navigationItem({
    required IconData icon,
    required bool selected,
    required Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        icon,
        color: selected ? AppColors.mainBlue : AppColors.darkBlue,
      ),
    );
  }
}
