import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/features/home/data/models/specialty_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpecialityCard extends StatelessWidget {
  const SpecialityCard({
    super.key,
    required this.specialtyModel,
    this.radius,
    this.height,
    this.width,
    this.textStyle,
    required this.onTap,
  });
  final Specialty specialtyModel;
  final double? radius;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 6.w,
          vertical: 3.h,
        ),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.zircon,
              radius: (radius ?? 30).r,
              child: SvgPicture.network(
                specialtyModel.image,
                height: (height ?? 25).h,
                width: (width ?? 25).w,
              ),
            ),
            const Spacer(),
            Text(
              specialtyModel.name,
              textAlign: TextAlign.center,
              style: textStyle ?? TextStyles.font12DarkBlueRegular,
            ),
          ],
        ),
      ),
    );
  }
}
