import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingDetailsCard extends StatelessWidget {
  const BookingDetailsCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  final String title;
  final String subtitle;
  final String icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: color.withAlpha(30),
        ),
        padding: EdgeInsets.all(8.w),
        child: SvgPicture.asset(
          icon,
          height: 24.h,
          width: 24.w,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        ),
      ),
      title: Text(title, style: TextStyles.font14DarkBlueBold),
      subtitle: Text(subtitle, style: TextStyles.font12GrayRegular),
    );
  }
}
