import 'package:completed_flutter_projects/core/helpers/extensions.dart';
import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/core/widgets/app_text_button.dart';
import 'package:completed_flutter_projects/core/widgets/app_top_bar.dart';
import 'package:completed_flutter_projects/features/appointment/data/models/appointment.dart';
import 'package:completed_flutter_projects/features/appointment/data/models/reschedule_request.dart';
import 'package:completed_flutter_projects/features/appointment/logic/cubit/appointment_cubit.dart';
import 'package:completed_flutter_projects/features/appointment/logic/cubit/appointment_state.dart';
import 'package:completed_flutter_projects/features/appointment/ui/widgets/horizontal_date_picker.dart';
import 'package:completed_flutter_projects/features/appointment/ui/widgets/vertical_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RescheduleScreen extends StatefulWidget {
  const RescheduleScreen({super.key, required this.appointment});
  final Appointment appointment;

  @override
  State<RescheduleScreen> createState() => _RescheduleScreenState();
}

class _RescheduleScreenState extends State<RescheduleScreen> {
  late DateTime selectedDate;
  late String selectedTime;
  void _selectDate(DateTime value) {
    setState(() {
      selectedDate = value;
    });
  }

  void _selectTime(String time) {
    setState(() {
      selectedTime = time;
    });
  }

  @override
  void initState() {
    super.initState();
    selectedDate = widget.appointment.date;
    selectedTime = widget.appointment.time;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppTopBar(title: 'Reschedule'),
            verticalSpace(15),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select Date',
                      style: TextStyles.font16DarkBlueSemiBold,
                    ),
                    verticalSpace(12),
                    HorizontalDatePicker(
                      date: selectedDate,
                      onDateSelected: (value) => _selectDate(value),
                    ),
                    verticalSpace(15),
                    Text(
                      'Available time',
                      style: TextStyles.font16DarkBlueSemiBold,
                    ),
                    verticalSpace(15),
                    VerticalTimePicker(
                      startTime: widget.appointment.doctorStartTime,
                      endTime: widget.appointment.doctorEndTime,
                      selectedTime: selectedTime,
                      onTimeSelected: (value) {
                        _selectTime(value);
                      },
                    ),
                    const Spacer(),
                    BlocListener<AppointmentCubit, AppointmentState>(
                      listener: (context, state) {
                        if (state is Success) {
                          context
                            ..pop()
                            ..pop();
                        }

                        if (state is Loading) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder:
                                (context) => const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.mainBlue,
                                  ),
                                ),
                          );
                        }
                      },
                      child: AppTextButton(
                        buttonText: 'Reschedule',
                        textStyle: TextStyles.font16WhiteSemiBold,
                        onPressed: () {
                          context
                              .read<AppointmentCubit>()
                              .emitRescheduleAppointment(
                                RescheduleRequest(
                                  id: widget.appointment.id,
                                  time: selectedTime,
                                  date: selectedDate,
                                ),
                              );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
