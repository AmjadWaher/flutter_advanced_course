import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.isSelected,
    required this.label,
    required this.onPressed,
  });
  final bool isSelected;
  final String label;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isSelected ? AppColors.mainBlue : AppColors.antiFlashWhite,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        elevation: 0,
        splashFactory: NoSplash.splashFactory,
        shadowColor: Colors.transparent,
      ),
      child: Text(
        label,
        style: isSelected
            ? TextStyles.font14WhiteRegular
            : TextStyles.font14SilverGrayRegular,
      ),
    );
  }
}

class SpecialtyFilterModel {
  final int id;
  final String name;

  SpecialtyFilterModel({required this.id, required this.name});
}
