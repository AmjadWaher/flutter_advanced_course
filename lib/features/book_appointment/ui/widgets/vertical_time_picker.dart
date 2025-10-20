import 'dart:developer';

import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/features/book_appointment/logic/cubit/booking_cubit.dart';
import 'package:completed_flutter_projects/features/book_appointment/logic/cubit/booking_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class VerticalTimePicker extends StatefulWidget {
  const VerticalTimePicker({
    super.key,
    required this.startTime,
    required this.endTime,
  });
  final String startTime;
  final String endTime;

  @override
  State<VerticalTimePicker> createState() => _VerticalTimePickerState();
}

class _VerticalTimePickerState extends State<VerticalTimePicker> {
  DateTime parseToDateTime(String time) {
    return DateFormat('HH:mm:ss').parse(time);
  }

  int slotCount(DateTime startTime, DateTime endTime) {
    return endTime.difference(startTime).inMinutes ~/ 30 + 1;
  }

  int to12Hour(int hour) {
    return hour % 12 == 0 ? 12 : hour % 12;
  }

  String formate(DateTime time) {
    final hourText = time.hour.toString().padLeft(2, '0');
    final minuteText = time.minute.toString().padLeft(2, '0');
    return '$hourText:$minuteText:00';
  }

  @override
  void initState() {
    super.initState();

    context.read<BookingCubit>().selectTime(widget.startTime);
  }

  @override
  Widget build(BuildContext context) {
    final start = parseToDateTime(widget.startTime);
    final end = parseToDateTime(widget.endTime);
    final count = slotCount(start, end);
    return BlocSelector<BookingCubit, BookingState, String>(
      selector: (state) => state.selectedTime!,
      builder: (context, state) {
        final cubit = context.read<BookingCubit>();
        final selectedTime = state;
        return SizedBox(
          height: 210.h,
          width: double.infinity,
          child: GridView.builder(
            controller: cubit.verticalController,
            itemCount: count,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 11,
              mainAxisSpacing: 12,
              mainAxisExtent: 45.w,
            ),
            itemBuilder: (context, index) {
              final time = start.add(Duration(minutes: (index) * 30));
              final isSelected =
                  DateFormat('HH:mm:ss').format(time) == selectedTime;

              return _timeCard(
                hour: to12Hour(time.hour).toString(),
                minute: time.minute.toString().padLeft(2, '0'),
                isMorning: time.hour < 12,
                isSelected: isSelected,
                onTap: () {
                  cubit.selectTime(formate(time));
                  cubit.scrollVerticalToSelected(time, start);
                  log(state);
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget _timeCard({
    required String hour,
    required String minute,
    required bool isSelected,
    required bool isMorning,
    required void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.mainBlue : AppColors.antiFlashWhite,
          borderRadius: BorderRadius.circular(14),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 14.h),
        child: Text(
          '$hour:$minute ${isMorning ? 'AM' : 'PM'}',
          style:
              isSelected
                  ? TextStyles.font14WhiteRegular
                  : TextStyles.font14SilverGrayMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
