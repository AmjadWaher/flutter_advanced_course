import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class HorizontalDatePicker extends StatefulWidget {
  const HorizontalDatePicker({
    super.key,
    required this.date,
    required this.onDateSelected,
  });
  final DateTime date;
  final ValueChanged<DateTime> onDateSelected;

  @override
  State<HorizontalDatePicker> createState() => _HorizontalDatePickerState();
}

class _HorizontalDatePickerState extends State<HorizontalDatePicker> {
  late DateTime selectedDate;

  late ScrollController _controller;
  final int daysToShow = 30;

  bool isBefore(DateTime a, DateTime b) {
    return DateTime(
      a.year,
      a.month,
      a.day,
    ).isBefore(DateTime(b.year, b.month, b.day));
  }

  bool isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  void _changeDate(DateTime newDate) {
    setState(() => selectedDate = newDate);
    widget.onDateSelected(newDate); // notify parent
    _scrollToSelectedDate(newDate);
  }

  void _scrollToSelectedDate(DateTime date) {
    final index = date.difference(DateTime.now()).inDays;
    if (index < 0 || index >= daysToShow) return;

    final itemWidth = 65.w;
    final screenWidth = 200.w;

    final offset = (index * itemWidth) - (screenWidth / 2) + (itemWidth / 2);

    _controller.animateTo(
      offset.clamp(0, _controller.position.maxScrollExtent),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    selectedDate = widget.date;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToSelectedDate(selectedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            final previousDay = selectedDate.subtract(const Duration(days: 1));
            if (!isBefore(previousDay, DateTime.now())) {
              _changeDate(previousDay);
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
              controller: _controller,
              scrollDirection: Axis.horizontal,
              itemCount: daysToShow,
              itemBuilder: (context, index) {
                final date = DateTime.now().add(Duration(days: index));
                final isSelected = isSameDate(date, selectedDate);

                return Align(
                  alignment: Alignment.center,
                  child: _dateCard(
                    dayName: DateFormat('E').format(date),
                    dayDate: DateFormat('dd').format(date),
                    isSelected: isSelected,
                    onTap: () => _changeDate(date),
                  ),
                );
              },
            ),
          ),
        ),
        horizontalSpace(5),
        GestureDetector(
          onTap: () {
            final nextDay = selectedDate.add(const Duration(days: 1));
            final lastDay = DateTime.now().add(Duration(days: daysToShow - 1));
            if (isBefore(nextDay, lastDay) || isSameDate(nextDay, lastDay)) {
              _changeDate(nextDay);
            }
          },
          child: Icon(Icons.chevron_right, size: 28.w),
        ),
      ],
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
