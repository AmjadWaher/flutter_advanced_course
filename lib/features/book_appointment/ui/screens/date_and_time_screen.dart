import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/features/book_appointment/ui/widgets/horizontal_date_picker.dart';
import 'package:completed_flutter_projects/features/book_appointment/ui/widgets/vertical_time_picker.dart';
import 'package:flutter/material.dart';

class DateAndTimeScreen extends StatelessWidget {
  const DateAndTimeScreen({
    super.key,
    required this.daysWork,
    required this.startTime,
    required this.endTime,
  });
  final String daysWork;
  final String startTime;
  final String endTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select Date', style: TextStyles.font16DarkBlueSemiBold),
        verticalSpace(12),
        const HorizontalDatePicker(),
        verticalSpace(15),
        Text('Available time', style: TextStyles.font16DarkBlueSemiBold),
        verticalSpace(24),
        VerticalTimePicker(startTime: startTime, endTime: endTime),
      ],
    );
  }
}
