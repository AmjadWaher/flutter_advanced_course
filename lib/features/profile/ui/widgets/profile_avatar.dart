import 'package:cached_network_image/cached_network_image.dart';
import 'package:completed_flutter_projects/features/profile/logic/cubit/profile_cubit.dart';
import 'package:completed_flutter_projects/features/profile/logic/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ProfileCubit, ProfileState, String?>(
      selector: (state) {
        return state is Success ? state.data.data.photo : null;
      },
      builder: (context, image) {
        return Positioned(
          top: 70.h,
          left: 0,
          right: 0,
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white,
            child:
                image != null && image.isNotEmpty
                    ? ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(100),
                      child: CachedNetworkImage(
                        height: 110,
                        width: 105,
                        imageUrl: image,
                        fit: BoxFit.cover,
                      ),
                    )
                    : const CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage(
                        'assets/images/male_face_avatar.png',
                      ),
                    ),
          ),
        );
      },
    );
  }
}
