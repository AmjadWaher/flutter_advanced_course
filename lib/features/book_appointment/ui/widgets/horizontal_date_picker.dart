import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/features/appointment/logic/cubit/booking_cubit.dart';
import 'package:completed_flutter_projects/features/appointment/logic/cubit/booking_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class HorizontalDatePicker extends StatelessWidget {
  const HorizontalDatePicker({super.key});

  final int daysToShow = 30;

  bool isLastDay(DateTime fDate, DateTime sDate) {
    DateTime first = DateTime(fDate.year, fDate.month, fDate.day);
    DateTime second = DateTime(sDate.year, sDate.month, sDate.day);

    return first.isBefore(second);
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BookingCubit, BookingState, DateTime>(
      selector: (state) => state.selectedDate!,
      builder: (context, state) {
        final cubit = context.read<BookingCubit>();
        final selectedDate = state;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          cubit.scrollHorizontalToSelected(selectedDate);
        });
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                if (state.isAfter(DateTime.now())) {
                  context.read<BookingCubit>().selectDate(
                    selectedDate.subtract(const Duration(days: 1)),
                  );
                }
              },
              child: Icon(Icons.chevron_left, size: 28.w),
            ),
            horizontalSpace(5),
            Flexible(
              child: SizedBox(
                height: 80.h,
                width: double.infinity,
                child: ListView.builder(
                  controller: cubit.horizontalController,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: daysToShow,
                  cacheExtent: 250,
                  itemBuilder: (context, index) {
                    final date = DateTime.now().add(Duration(days: index));
                    final isSelected =
                        DateFormat('d').format(date) ==
                        DateFormat('d').format(selectedDate);
                    return Align(
                      alignment: Alignment.center,
                      child: _dateCard(
                        dayName: DateFormat('E').format(date),
                        dayDate: DateFormat('dd').format(date),
                        isSelected: isSelected,
                        onTap: () {
                          context.read<BookingCubit>().selectDate(date);
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            horizontalSpace(5),
            GestureDetector(
              onTap: () {
                final lastDay = DateTime.now().add(
                  Duration(days: daysToShow - 1),
                );
                if (isLastDay(selectedDate, lastDay)) {
                  context.read<BookingCubit>().selectDate(
                    selectedDate.add(const Duration(days: 1)),
                  );
                }
              },
              child: Icon(Icons.chevron_right, size: 28.w),
            ),
          ],
        );
      },
    );
  }

  Widget _dateCard({
    required String dayName,
    required String dayDate,
    required bool isSelected,
    required void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        height: isSelected ? 60.h : 55.h,
        width: isSelected ? 58.h : 50.h,
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.mainBlue : AppColors.antiFlashWhite,
          borderRadius: BorderRadius.circular(14),
        ),
        margin: EdgeInsets.only(right: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              dayName,
              style:
                  isSelected
                      ? TextStyles.font14WhiteSemiBold
                      : TextStyles.font12SilverGrayMedium,
            ),
            Text(
              dayDate,
              style:
                  isSelected
                      ? TextStyles.font14WhiteSemiBold
                      : TextStyles.font12SilverGrayMedium,
            ),
          ],
        ),
      ),
    );
  }
}
