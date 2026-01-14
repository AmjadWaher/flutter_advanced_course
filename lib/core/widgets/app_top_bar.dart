import 'package:completed_flutter_projects/core/helpers/extensions.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTopBar extends StatelessWidget {
  const AppTopBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 0, bottom: 10.h),
        child: Row(
          children: [
            _buildBackButton(context),
            const Spacer(),
            Text(title, style: TextStyles.font18DarkBlueSemiBold),
            const Spacer(),
            const SizedBox(width: 40, height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return InkWell(
      onTap: () => context.pop(),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.snowGray, width: 1),
        ),
        child: const Icon(Icons.arrow_back_ios_new, size: 20),
      ),
    );
  }
}
