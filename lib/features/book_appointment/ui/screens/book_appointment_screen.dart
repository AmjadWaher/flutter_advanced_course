import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/core/widgets/app_text_button.dart';
import 'package:completed_flutter_projects/core/widgets/app_top_bar.dart';
import 'package:completed_flutter_projects/features/book_appointment/ui/screens/date_and_time_screen.dart';
import 'package:completed_flutter_projects/features/book_appointment/ui/screens/payment_screen.dart';
import 'package:completed_flutter_projects/features/book_appointment/ui/screens/summary_screen.dart';
import 'package:completed_flutter_projects/features/book_appointment/ui/widgets/summary_bottom_sheet.dart';
import 'package:completed_flutter_projects/features/home/data/models/doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key, required this.doctor});
  final Doctor doctor;

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  final _pageController = PageController();
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: _bottomSheet(),
      body: SafeArea(
        child: Column(
          children: [
            AppTopBar(title: 'Book Appointment'),
            _progressStepper(pageIndex),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 24.w, left: 24.w, bottom: 15.h),
                child: PageView(
                  controller: _pageController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    DateAndTimeScreen(
                      daysWork: widget.doctor.workDays,
                      startTime: widget.doctor.startTime,
                      endTime: widget.doctor.endTime,
                    ),
                    PaymentScreen(),
                    SummaryScreen(doctor: widget.doctor),
                  ],
                  onPageChanged: (value) {
                    setState(() {
                      pageIndex = value;
                    });
                  },
                ),
              ),
            ),
            if (pageIndex != 2)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
                child: AppTextButton(
                  buttonText: 'Continue',
                  textStyle: TextStyles.font16WhiteSemiBold,
                  onPressed: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _bottomSheet() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 150),
      transitionBuilder: (child, animation) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));

        return SlideTransition(position: offsetAnimation, child: child);
      },
      child:
          pageIndex == 2
              ? BottomSheet(
                elevation: 0,
                backgroundColor: Colors.white.withAlpha(0),
                onClosing: () {},
                enableDrag: false,
                builder: (context) => SummaryBottomSheet(doctor: widget.doctor),
              )
              : SizedBox.shrink(),
    );
  }

  Widget _progressStepper(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 35.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _stepCard(
            stepNumber: '1',
            stepTitle: 'Date & Time',
            isDone: index > 0,
            isCurrent: index == 0,
          ),
          Flexible(
            child: Divider(
              color: index > 1 ? AppColors.limeGreen : AppColors.snowGray,
              height: 4.h,
              radius: BorderRadius.circular(14),
            ),
          ),
          _stepCard(
            stepNumber: '2',
            stepTitle: 'Payment',
            isDone: index > 1,
            isCurrent: index == 1,
          ),
          Flexible(
            child: Divider(
              color: AppColors.snowGray,
              height: 4.h,
              radius: BorderRadius.circular(14),
            ),
          ),
          _stepCard(
            stepNumber: '3',
            stepTitle: 'Summary',
            isDone: index > 2,
            isCurrent: index == 2,
          ),
        ],
      ),
    );
  }

  Widget _stepCard({
    required String stepTitle,
    required String stepNumber,
    required bool isDone,
    required bool isCurrent,
  }) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color:
                isDone
                    ? AppColors.limeGreen
                    : isCurrent
                    ? AppColors.mainBlue
                    : AppColors.lightGray,
          ),
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 13.w),
          child: Text(stepNumber, style: TextStyles.font11WhiteMedium),
        ),
        verticalSpace(8),
        Text(
          stepTitle,
          style:
              isDone
                  ? TextStyles.font12LimeGreenRegular
                  : isCurrent
                  ? TextStyles.font12DarkBlueRegular
                  : TextStyles.font12NeutralGrayRegular,
        ),
      ],
    );
  }
}
