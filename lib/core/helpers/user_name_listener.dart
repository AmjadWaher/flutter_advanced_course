import 'package:completed_flutter_projects/core/helpers/constants.dart';
import 'package:completed_flutter_projects/core/helpers/shared_pref_helper.dart';
import 'package:flutter/material.dart';

class UserNameListener {
  static final ValueNotifier<String> userNameNotifier = ValueNotifier('User');

  Future<void> init() async {
    final name = await SharedPrefHelper.getString(SharedPrefKeys.userName);
    userNameNotifier.value = name ?? 'User';
  }

  Future<void> updateUserName(String newName) async {
    await SharedPrefHelper.setData(SharedPrefKeys.userName, newName);
    userNameNotifier.value = newName;
  }
}
