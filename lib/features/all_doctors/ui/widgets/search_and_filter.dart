import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/core/widgets/app_text_button.dart';
import 'package:completed_flutter_projects/core/widgets/filter_button.dart';
import 'package:completed_flutter_projects/features/all_doctors/logic/cubit/all_doctors_cubit.dart';
import 'package:completed_flutter_projects/features/home/data/models/specialty_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({
    super.key,
    required this.specialtiesFilterList,
    this.specialty,
  });
  final List<SpecialtyFilterModel> specialtiesFilterList;
  final Specialty? specialty;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Row(
        children: [
          _buildSearchField(context),
          horizontalSpace(2),
          if (specialty == null)
            IconButton(
              onPressed: () => _showFilterBottomSheet(context),
              icon: Icon(Icons.filter_list),
            ),
        ],
      ),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyles.font12SilverGrayMedium,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColors.whiteSmoke,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: SvgPicture.asset(
              'assets/svgs/search_normal.svg',
              colorFilter: ColorFilter.mode(
                AppColors.silverGray,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        onChanged: (value) {
          context.read<AllDoctorsCubit>().emitSearchedDoctors(value,specialtyId: specialty?.id);
        },
      ),
    );
  }

  Future _showFilterBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      constraints: BoxConstraints(maxHeight: 360.h, minWidth: double.infinity),
      builder: (bottomSheetContext) {
        int selectedSpecialty = -1;

        return StatefulBuilder(
          builder: (ctx, setModalState) {
            return Padding(
              padding: EdgeInsets.only(top: 9.h, bottom: 50.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBottomSheetHandle(),
                  verticalSpace(25),
                  _buildBottomSheetTitle(),
                  verticalSpace(10),
                  _buildDivider(),
                  verticalSpace(10),
                  _buildSpecialtySection(
                    selectedSpecialty,
                    onSelected:
                        (id) => setModalState(() => selectedSpecialty = id),
                  ),
                  const Spacer(),
                  _buildDoneButton(
                    context,
                    bottomSheetContext,
                    selectedSpecialty,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildBottomSheetHandle() {
    return Divider(
      indent: 160.w,
      endIndent: 160.w,
      color: AppColors.silverGray.withAlpha(51),
      thickness: 4.h,
    );
  }

  Widget _buildBottomSheetTitle() {
    return Center(
      child: Text('Sort By', style: TextStyles.font18DarkBlueSemiBold),
    );
  }

  Widget _buildDivider() {
    return Divider(
      indent: 24.w,
      endIndent: 24.w,
      color: AppColors.silverGray.withAlpha(51),
    );
  }

  Widget _buildSpecialtySection(
    int selectedSpecialty, {
    required Function(int id) onSelected,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Specialty', style: TextStyles.font16DarkBlueMedium),
          verticalSpace(24),
          _buildFilterSpecialtyOption(
            specialtiesFilterList,
            selectedSpecialty,
            onSelected: onSelected,
          ),
        ],
      ),
    );
  }

  Widget _buildDoneButton(
    BuildContext context,
    BuildContext bottomSheetContext,
    int selectedSpecialty,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: AppTextButton(
        buttonText: 'Done',
        textStyle: TextStyles.font16WhiteSemiBold,
        onPressed: () {
          context.read<AllDoctorsCubit>().emitAllDoctorsBySpecialtyId(
            selectedSpecialty,
          );

          Navigator.of(bottomSheetContext).pop();
        },
      ),
    );
  }

  Widget _buildFilterSpecialtyOption(
    List<SpecialtyFilterModel> specialties,
    int selectedSpecialty, {
    required Function(int) onSelected,
  }) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: specialtiesFilterList.length,
        separatorBuilder: (context, index) => horizontalSpace(12),
        itemBuilder: (context, index) {
          final specialty = specialties[index];
          return FilterButton(
            label: specialty.name,
            isSelected: selectedSpecialty == specialty.id,
            onPressed: () => onSelected(specialty.id),
          );
        },
      ),
    );
  }
}
