import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: Column(
          children: [
            _buildSpecilatyListShimmer(),
            verticalSpace(10),
            _buildDoctorListShimmer(),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecilatyListShimmer() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              _textShimmer(height: 25, width: 141),
              const Spacer(),
              _textShimmer(height: 18, width: 39),
            ],
          ),
        ),
        verticalSpace(12),
        SizedBox(
          height: 120.h,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: 5,
            itemBuilder: (context, index) => _specialtyCardShimmer(),
            separatorBuilder:
                (context, index) => horizontalSpace(index == 4 ? 0 : 12),
          ),
        ),
      ],
    );
  }

  Widget _buildDoctorListShimmer() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              _textShimmer(height: 25, width: 141),
              const Spacer(),
              _textShimmer(height: 18, width: 39),
            ],
          ),
        ),
        verticalSpace(12),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 2.h),
          itemBuilder: (context, index) => _doctorCardShimmer(),
          itemCount: 5,
          separatorBuilder: (context, index) => const SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget _specialtyCardShimmer() {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w, vertical: 5.h),
      child: Column(
        children: [
          CircleAvatar(radius: 30.r),
          verticalSpace(12),
          _textShimmer(height: 16, width: 45),
        ],
      ),
    );
  }

  Widget _doctorCardShimmer() {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 2.w, vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 110.h,
            width: 110.w,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          horizontalSpace(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textShimmer(height: 22, width: 130),
              verticalSpace(9),
              _textShimmer(height: 18, width: 180),
              verticalSpace(12),
              _textShimmer(height: 16, width: 120),
            ],
          ),
        ],
      ),
    );
  }

  Widget _textShimmer({required int height, required int width}) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
