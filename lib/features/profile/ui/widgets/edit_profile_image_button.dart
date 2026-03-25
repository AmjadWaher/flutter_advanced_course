import 'dart:developer';

import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/features/profile/logic/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileImageButton extends StatelessWidget {
  const EditProfileImageButton({super.key});

  Future<XFile?> pickImageFromGallery() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 120,
      right: 5,
      child: InkWell(
        onTap: () async {
          final image = await pickImageFromGallery();
          if (image != null && context.mounted) {
            log(image.name);
            context.read<ProfileCubit>().selectImage(image.path);
          }
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: const CircleAvatar(
          radius: 16,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 14,
            backgroundColor: AppColors.whiteSmoke,
            child: Icon(
              Icons.edit_outlined,
              color: AppColors.mainBlue,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
