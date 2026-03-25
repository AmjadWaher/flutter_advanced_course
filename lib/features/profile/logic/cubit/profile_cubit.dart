import 'dart:developer';
import 'dart:io';

import 'package:completed_flutter_projects/core/helpers/app_regex.dart';
import 'package:completed_flutter_projects/core/helpers/user_name_listener.dart';
import 'package:completed_flutter_projects/core/networking/api_result.dart'
    as api_result;
import 'package:completed_flutter_projects/features/profile/data/models/profile_request.dart';
import 'package:completed_flutter_projects/features/profile/data/models/profile_response.dart';
import 'package:completed_flutter_projects/features/profile/data/repository/profile_repository.dart';
import 'package:completed_flutter_projects/features/profile/logic/cubit/profile_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository _profileRepository;
  String? userImage;
  File? selectedImage;
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  ProfileCubit(this._profileRepository) : super(const ProfileState.initial());

  void _mapUserData(UserData data) {
    userImage = data.photo;
    userNameController.text = data.userName;
    phoneNumberController.text = data.phoneNumber;
  }

  void selectImage(String? imagePath) {
    selectedImage = imagePath != null ? File(imagePath) : null;
    log('Selected Image: ${selectedImage?.path}');
    state.maybeWhen(
      success: (data, _) {
        emit(ProfileState.success(data: data, selectedImage: selectedImage));
      },
      orElse: () {},
    );
  }

  void getPersonalInformation() async {
    emit(const ProfileState.loading());
    final result = await _profileRepository.getProfile();

    switch (result) {
      case api_result.Success(:final data):
        _mapUserData(data.data);
        emit(ProfileState.success(data: data));
        break;

      case api_result.Failure(:final error):
        emit(ProfileState.failure(message: error.apiErrorModel.message ?? ''));
        break;
    }
  }

  Future<void> updateInformation() async {
    emit(const ProfileState.loading());
    if (phoneNumberController.text.isEmpty ||
        !AppRegex.isValidPhoneNumber(phoneNumberController.text)) {
      emit(
        const ProfileState.failure(
          message: 'Please enter a valid phone number',
        ),
      );
      return;
    }
    final result = await _profileRepository.updateProfile(
      ProfileRequest(
        phoneNumber: phoneNumberController.text,
        userName: userNameController.text,
        photo: selectedImage,
      ).toFormData(),
    );

    switch (result) {
      case api_result.Success(:final data):
        _mapUserData(data.data);
        selectedImage = null;
        await UserNameListener().updateUserName(userNameController.text);
        emit(ProfileState.success(data: data));
        break;

      case api_result.Failure(:final error):
        emit(ProfileState.failure(message: error.apiErrorModel.message ?? ''));
        break;
    }
  }

  @override
  Future<void> close() {
    userNameController.dispose();
    phoneNumberController.dispose();
    return super.close();
  }
}
