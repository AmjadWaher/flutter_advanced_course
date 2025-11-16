import 'package:cached_network_image/cached_network_image.dart';
import 'package:completed_flutter_projects/core/helpers/extensions.dart';
import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/routing/routes.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/features/home/data/models/doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.doctor,
    this.height,
    this.width,
    this.color,
    this.elevation,
    this.trailing,
    this.onTap,
  });
  final Doctor doctor;
  final double? height;
  final double? width;
  final Color? color;
  final double? elevation;
  final Widget? trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          onTap ??
          () =>
              context.pushNamed(Routes.doctorDetailsScreen, arguments: doctor),
      child: Card(
        margin: EdgeInsetsDirectional.symmetric(horizontal: 2.w, vertical: 8.h),
        color: color ?? Colors.white.withAlpha(0),
        elevation: elevation ?? 0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: doctor.photo,
                height: (height ?? 105).h,
                width: (width ?? 105).w,
                fit: BoxFit.cover,
              ),
            ),
            horizontalSpace(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor.username.capitalizeEachWord(),
                  style: TextStyles.font16DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(6),
                Text(
                  '${doctor.specialization.name} | ${doctor.phoneNumber}',
                  style: TextStyles.font12GrayMedium,
                ),
                verticalSpace(5),
                Text(doctor.clinic.name, style: TextStyles.font12GrayMedium),
              ],
            ),
            if (trailing != null) ...[const Spacer(), trailing!],
          ],
        ),
      ),
    );
  }
}
