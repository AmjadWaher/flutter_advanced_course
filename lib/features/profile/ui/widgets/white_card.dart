import 'package:completed_flutter_projects/core/helpers/constants.dart';
import 'package:completed_flutter_projects/core/helpers/shared_pref_helper.dart';
import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/features/profile/logic/cubit/profile_cubit.dart';
import 'package:completed_flutter_projects/features/profile/logic/cubit/profile_state.dart';
import 'package:completed_flutter_projects/features/profile/ui/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhiteCard extends StatelessWidget {
  const WhiteCard({super.key});
  Future<String?> get getUserEmail async =>
      await SharedPrefHelper.getString(SharedPrefKeys.userEmail);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is Success) {
          return Positioned.fill(
            top: 130.h,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 70,
                  horizontal: 24,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        state.data.data.userName,
                        style: TextStyles.font20DarkBlueSemiBold,
                      ),
                      verticalSpace(8),
                      FutureBuilder(
                        future: getUserEmail,
                        builder: (context, snapshot) {
                          final email = snapshot.data ?? 'Email';
                          return Text(
                            email,
                            style:
                                TextStyles.font14DarkGrayRegularWith40perAlpha,
                          );
                        },
                      ),
                      verticalSpace(24),
                      const ProfileMenu(),
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        if (state is Failure) {
          return Center(child: Text(state.message));
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
