import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class VerticalTimePicker extends StatefulWidget {
  const VerticalTimePicker({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.selectedTime,
    required this.onTimeSelected,
  });

  final String startTime;
  final String endTime;
  final String selectedTime;
  final ValueChanged<String> onTimeSelected;

  @override
  State<VerticalTimePicker> createState() => _VerticalTimePickerState();
}

class _VerticalTimePickerState extends State<VerticalTimePicker> {
  late ScrollController _controller;
  late String selectedTime;

  DateTime parseToDateTime(String time) {
    return DateFormat('HH:mm:ss').parse(time);
  }

  int slotCount(DateTime startTime, DateTime endTime) {
    return endTime.difference(startTime).inMinutes ~/ 30 + 1;
  }

  int to12Hour(int hour) => hour % 12 == 0 ? 12 : hour % 12;

  String formatTime(DateTime time) {
    final hourText = time.hour.toString().padLeft(2, '0');
    final minuteText = time.minute.toString().padLeft(2, '0');
    return '$hourText:$minuteText:00';
  }

  void scrollToSelected(DateTime selected, DateTime start) {
    final index = selected.difference(start).inMinutes ~/ 30;

    final rowIndex = index ~/ 2;
    final itemHeight = 45.w + 12;
    final visibleHeight = 210.h;

    final offset =
        (rowIndex * itemHeight) - (visibleHeight / 2) + (itemHeight / 2);

    if (_controller.hasClients) {
      _controller.animateTo(
        offset.clamp(0, _controller.position.maxScrollExtent),
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
      );
    }
  }

  void changeSelectedTime(String time) {
    setState(() {
      selectedTime = time;
    });
    widget.onTimeSelected(time);
    scrollToSelected(parseToDateTime(time), parseToDateTime(widget.startTime));
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    selectedTime = widget.selectedTime;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToSelected(
        parseToDateTime(selectedTime),
        parseToDateTime(widget.startTime),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final start = parseToDateTime(widget.startTime);
    final end = parseToDateTime(widget.endTime);
    final count = slotCount(start, end);

    return SizedBox(
      height: 210.h,
      width: double.infinity,
      child: GridView.builder(
        controller: _controller,
        itemCount: count,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 11.w,
          mainAxisSpacing: 12.h,
          mainAxisExtent: 45.w,
        ),
        itemBuilder: (context, index) {
          final time = start.add(Duration(minutes: index * 30));
          final isSelected =
              DateFormat('HH:mm:ss').format(time) == selectedTime;
          return _timeCard(
            hour: to12Hour(time.hour).toString(),
            minute: time.minute.toString().padLeft(2, '0'),
            isMorning: time.hour < 12,
            isSelected: isSelected,
            onTap: () => changeSelectedTime(formatTime(time)),
          );
        },
      ),
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
        child: Center(
          child: Text(
            '$hour:$minute ${isMorning ? 'AM' : 'PM'}',
            style:
                isSelected
                    ? TextStyles.font14WhiteRegular
                    : TextStyles.font14SilverGrayMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
