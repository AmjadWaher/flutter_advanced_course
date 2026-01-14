import 'package:completed_flutter_projects/core/di/dependence_injection.dart';
import 'package:completed_flutter_projects/features/appointment/logic/cubit/appointment_cubit.dart';
import 'package:completed_flutter_projects/features/appointment/ui/screens/my_appointment_screen.dart';
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

  Widget _buildAppointmentsScreen() {
    return BlocProvider(
      key: ValueKey(DateTime.now().millisecondsSinceEpoch),
      create: (context) => AppointmentCubit(getIt())..emitAppointmentStates(),
      child: const MyAppointmentScreen(),
    );
  }

  @override
  void initState() {
    super.initState();
    items = [
      BlocProvider(
        create:
            (context) => HomeCubit(getIt())..emitSpecialtiesAndDoctorsStates(),
        child: const HomeScreen(),
      ),
      _buildAppointmentsScreen(),

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
            if (index == 1) {
              items[1] = _buildAppointmentsScreen();
            }
          }
        },
      ),
    );
  }
}
