import 'dart:developer';

import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/features/appointment/logic/cubit/appointment_cubit.dart';
import 'package:completed_flutter_projects/features/appointment/logic/cubit/appointment_state.dart';
import 'package:completed_flutter_projects/features/appointment/ui/widgets/cancelled_tab.dart';
import 'package:completed_flutter_projects/features/appointment/ui/widgets/completed_tab.dart';
import 'package:completed_flutter_projects/features/appointment/ui/widgets/upcoming_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppointmentScreen extends StatelessWidget {
  const MyAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Appointment',
            style: TextStyles.font18DarkBlueSemiBold,
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.h),
            child: Column(
              children: [
                const TabBar(
                  tabs: [
                    Tab(text: 'Upcoming'),
                    Tab(text: 'Completed'),
                    Tab(text: 'Cancelled'),
                  ],
                ),
                Expanded(
                  child: BlocBuilder<AppointmentCubit, AppointmentState>(
                    buildWhen:
                        (previous, current) =>
                            current is Failure ||
                            current is Loading ||
                            current is Success,
                    builder: (context, state) {
                      log('rebuild');
                      if (state is Success) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: TabBarView(
                            children: [
                              UpcomingTab(
                                upcomingAppointments: state.data.upcoming,
                              ),
                              CompletedTab(
                                completedAppointments: state.data.completed,
                              ),
                              CancelledTab(
                                cancelledAppointments: state.data.cancelled,
                              ),
                            ],
                          ),
                        );
                      } else if (state is Failure) {
                        return Center(child: Text(state.error));
                      }

                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.mainBlue,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
