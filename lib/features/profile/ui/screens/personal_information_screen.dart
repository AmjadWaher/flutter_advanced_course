import 'package:cached_network_image/cached_network_image.dart';
import 'package:completed_flutter_projects/core/helpers/snack_bar.dart';
import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/widgets/app_elevated_button.dart';
import 'package:completed_flutter_projects/core/widgets/app_top_bar.dart';
import 'package:completed_flutter_projects/features/profile/logic/cubit/profile_cubit.dart';
import 'package:completed_flutter_projects/features/profile/logic/cubit/profile_state.dart';
import 'package:completed_flutter_projects/features/profile/ui/widgets/edit_profile_image_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is Failure) {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                snackBar(
                  content:
                      state.message.isNotEmpty
                          ? state.message
                          : 'Sorry, please try again later.',
                  title: 'Something went wrong',
                  icon: Icons.error_outline,
                  backgroundColor: Colors.red,
                ),
              );
            }
            if (state is Success) {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                snackBar(
                  content: state.data.message,
                  title: 'Successfully',
                  icon: Icons.info_outline,
                  backgroundColor: AppColors.mainBlue,
                ),
              );
            }
          },
          builder: (context, state) {
            final isLoading = state is Loading;
            return Column(
              children: [
                const AppTopBar(title: 'Personal Information'),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 10.h,
                    ),
                    child: ListView(
                      children: [
                        verticalSpace(50),
                        Center(child: _buildAvatar(context)),
                        verticalSpace(30),
                        TextField(
                          controller:
                              context.read<ProfileCubit>().userNameController,
                        ),
                        verticalSpace(15),
                        TextField(
                          controller:
                              context
                                  .read<ProfileCubit>()
                                  .phoneNumberController,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                    bottom: 40.h,
                  ),
                  child: AppElevatedButton(
                    title: 'Save',
                    isLoading: isLoading,
                    onPressed: () async {
                      await context.read<ProfileCubit>().updateInformation();
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildAvatar(BuildContext context) {
    final cubit = context.watch<ProfileCubit>();
    final image = cubit.selectedImage;
    return Stack(
      children: [
        CircleAvatar(
          radius: 80,
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(100),
            child:
                image != null
                    ? Image.file(
                      image,
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                    : CachedNetworkImage(
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      imageUrl: cubit.userImage ?? '',
                      progressIndicatorBuilder: (context, url, progress) {
                        return CircularProgressIndicator(
                          value: progress.progress,
                          color: AppColors.mainBlue,
                        );
                      },
                    ),
          ),
        ),
        const EditProfileImageButton(),
      ],
    );
  }
}
