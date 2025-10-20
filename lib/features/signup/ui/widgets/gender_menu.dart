import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/features/signup/data/models/sign_up_request_body.dart';
import 'package:completed_flutter_projects/features/signup/logic/cubit/sign_up_cubit.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderMenu extends StatefulWidget {
  const GenderMenu({super.key});

  @override
  State<GenderMenu> createState() => _GenderMenuState();
}

class _GenderMenuState extends State<GenderMenu> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<Gender>(
        isExpanded: true,
        items: [
          DropdownMenuItem(
            value: Gender.male,
            child: Text('Male'),
          ),
          DropdownMenuItem(
            value: Gender.female,
            child: Text('Female'),
          ),
        ],
        value: context.read<SignUpCubit>().gender,
        onChanged: (value) {
          final gender = context.read<SignUpCubit>().gender;
          if (value != null && value.name != gender.name) {
            setState(() {
              context.read<SignUpCubit>().selectedGender(value);
            });
          }
        },
        buttonStyleData: ButtonStyleData(
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.snowGray,
            ),
            color: AppColors.paleGray,
          ),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
          ),
          iconSize: 22,
          iconEnabledColor: Colors.black,
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
