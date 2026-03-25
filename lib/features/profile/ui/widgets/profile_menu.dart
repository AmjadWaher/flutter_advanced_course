import 'package:completed_flutter_projects/core/di/dependence_injection.dart';
import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/features/book_appointment/logic/cubit/payment/payment_cubit.dart';
import 'package:completed_flutter_projects/features/profile/logic/cubit/profile_cubit.dart';
import 'package:completed_flutter_projects/features/profile/ui/screens/personal_information_screen.dart';
import 'package:completed_flutter_projects/features/profile/ui/screens/payment_screen.dart';
import 'package:completed_flutter_projects/features/profile/ui/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileMenuItem(
          title: 'Personal Information',
          icon: 'assets/svgs/personal_card.svg',
          color: AppColors.mainBlue,
          onTap: () {
            final cubit = context.read<ProfileCubit>();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder:
                    (_) => BlocProvider.value(
                      value: cubit,
                      child: const PersonalInformationScreen(),
                    ),
              ),
            );
          },
        ),
        verticalSpace(16),
        ProfileMenuItem(
          title: 'Payment',
          icon: 'assets/svgs/payment.svg',
          color: AppColors.coralRed,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder:
                    (_) => BlocProvider(
                      create: (context) => PaymentCubit(getIt())..savedCards(),
                      child: const PaymentScreen(),
                    ),
              ),
            );
          },
        ),
      ],
    );
  }
}
