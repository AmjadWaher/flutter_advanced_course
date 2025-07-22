import 'package:completed_flutter_projects/core/di/dependence_injection.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/features/home/logic/home_cubit.dart';
import 'package:completed_flutter_projects/features/home/ui/home_screen.dart';
import 'package:completed_flutter_projects/main_home/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int selectedTap = 0;
  List<Widget> items = [];

  @override
  void initState() {
    super.initState();
    items = [
      BlocProvider(
        create: (context) =>
            HomeCubit(getIt())..emitSpecialtiesAndDoctorsStates(),
        child: const HomeScreen(),
      ),

      // const MessageScreen(),

      // const AppointmentScreen(),

      // const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedTap,
        children: items,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 70,
        width: 70,
        margin: EdgeInsets.only(top: 25.h),
        child: FloatingActionButton(
          onPressed: () {},
          elevation: 0.0,
          foregroundColor: Colors.white,
          backgroundColor: AppColors.mainBlue,
          splashColor: Colors.transparent,
          highlightElevation: 0.0,
          focusElevation: 0.0,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 8, color: Colors.white),
            borderRadius: BorderRadius.circular(28.r),
          ),
          child: SvgPicture.asset('assets/svgs/search_normal.svg'),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        pageIndex: selectedTap,
        onTap: (index) {
          if (index != selectedTap) {
            setState(() {
              selectedTap = index;
            });
          }
        },
      ),
    );
  }
}
