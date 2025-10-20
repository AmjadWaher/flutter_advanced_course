import 'package:completed_flutter_projects/core/helpers/extensions.dart';
import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/routing/routes.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/core/widgets/app_text_button.dart';
import 'package:completed_flutter_projects/core/widgets/app_top_bar.dart';
import 'package:completed_flutter_projects/core/widgets/doctor_card.dart';
import 'package:completed_flutter_projects/features/doctor_details/ui/screens/about_doctor_screen.dart';
import 'package:completed_flutter_projects/features/doctor_details/ui/screens/location_screen.dart';
import 'package:completed_flutter_projects/features/home/data/models/doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key, required this.doctor});
  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              AppTopBar(title: doctor.username.replaceFirstDot().capitalizeEachWork()),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 12.h,
                  ),
                  child: Column(
                    children: [
                      _showDoctorInfo(),
                      verticalSpace(24),
                      TabBar(
                        tabs: const [Tab(text: 'About'), Tab(text: 'Location')],
                      ),
                      verticalSpace(28),
                      Expanded(
                        child: TabBarView(
                          children: [
                            AboutDoctorScreen(doctor: doctor),
                            LocationScreen(clinic: doctor.clinic),
                          ],
                        ),
                      ),
                      verticalSpace(16),
                      AppTextButton(
                        buttonText: 'Make An Appointment',
                        textStyle: TextStyles.font16WhiteSemiBold,
                        onPressed: () => context.pushNamed(Routes.bookAppointmentScreen,arguments: doctor),
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpace(16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showDoctorInfo() {
    return DoctorCard(
      doctor: doctor,
      height: 80,
      width: 80,
      onTap: () {},
    );
  }
}
