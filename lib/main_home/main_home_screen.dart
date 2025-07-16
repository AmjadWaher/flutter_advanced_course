import 'package:completed_flutter_projects/core/di/dependence_injection.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/features/home/logic/home_cubit.dart';
import 'package:completed_flutter_projects/features/home/ui/home_screen.dart';
import 'package:completed_flutter_projects/main_home/model/navigation_model.dart';
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
  final homeKey = GlobalKey<NavigatorState>();
  final messageKey = GlobalKey<NavigatorState>();
  final appointmentKey = GlobalKey<NavigatorState>();
  final profileKey = GlobalKey<NavigatorState>();
  int selectedTap = 0;
  List<NavigationModel> items = [];

  @override
  void initState() {
    super.initState();
    items = [
      NavigationModel(
        page: BlocProvider(
          create: (context) => HomeCubit(getIt())..emitSpecialtiesAndDoctorsStates(),
          child: const HomeScreen(),
        ),
        navigatorKey: homeKey,
      ),
      // NavigationModel(
      //   page: const MessageScreen(),
      //   navigatorKey: messageKey,
      // ),
      // NavigationModel(
      //   page: const AppointmentScreen(),
      //   navigatorKey: appointmentKey,
      // ),
      // NavigationModel(
      //   page: const ProfileScreen(),
      //   navigatorKey: profileKey,
      // ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (items[selectedTap].navigatorKey.currentState?.canPop() ?? false) {
          items[selectedTap].navigatorKey.currentState?.pop();
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: selectedTap,
          children: items
              .map(
                (page) => Navigator(
                  key: page.navigatorKey,
                  onGenerateInitialRoutes: (navigator, initialRoute) {
                    return [
                      MaterialPageRoute(
                        builder: (context) => page.page,
                      )
                    ];
                  },
                ),
              )
              .toList(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          height: 72.h, 
          width: 72.w,
          margin: EdgeInsets.only(top: 25.h),
          child: FloatingActionButton(
            onPressed: () {},
            elevation: 0.0,
            foregroundColor: Colors.white,
            backgroundColor: AppColors.mainBlue,
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
            if (index == selectedTap) {
              items[index].navigatorKey.currentState?.popUntil(
                    (route) => route.isFirst,
                  );
            } else {
              setState(() {
                selectedTap = index;
              });
            }
          },
        ),
      ),
    );
  }
}
