import 'package:completed_flutter_projects/core/di/dependence_injection.dart';
import 'package:completed_flutter_projects/features/home/logic/home_cubit.dart';
import 'package:completed_flutter_projects/features/home/ui/home_screen.dart';
import 'package:completed_flutter_projects/main_home/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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
        create:
            (context) => HomeCubit(getIt())..emitSpecialtiesAndDoctorsStates(),
        child: const HomeScreen(),
      ),
      // BlocProvider(
      //   create: (context) => AppointmentCubit(getIt()),
      //   child: MyAppointmentScreen(),
      // ),

      // const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: selectedTap, children: items),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
