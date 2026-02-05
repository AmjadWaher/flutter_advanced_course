// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';

class ProfileRequest {
  File photo;
  String userName;
  String phoneNumber;
  ProfileRequest({
    required this.photo,
    required this.userName,
    required this.phoneNumber,
  });

  FormData toFormData() {
    return FormData.fromMap({
      "userName": userName,
      "phoneNumber": phoneNumber,
      "image": MultipartFile.fromFileSync(
        photo.path,
        filename: photo.path.split('/').last,
      ),
    });
  }
}
