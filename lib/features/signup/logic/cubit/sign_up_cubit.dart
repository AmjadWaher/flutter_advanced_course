import 'package:completed_flutter_projects/features/signup/data/models/sign_up_request_body.dart';
import 'package:completed_flutter_projects/core/networking/api_result.dart'
    as api_result;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:completed_flutter_projects/features/signup/data/repository/sign_up_repository.dart';
import 'package:completed_flutter_projects/features/signup/logic/cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepository _signUpRepository;

  SignUpCubit(this._signUpRepository) : super(const SignUpState.initial());

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  Gender gender = Gender.male;

  void emitSignUpStates() async {
    emit(const SignUpState.loading());
    final response = await _signUpRepository.signup(
      SignUpRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        gender: gender,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
      ),
    );

    switch (response) {
      case api_result.Success(:final data):
        emit(SignUpState.success(data));
        break;

      case api_result.Failure(:final error):
        emit(SignUpState.error(message: error.apiErrorModel.message ?? ''));
        break;
    }
  }

  void selectedGender(Gender value) {
    gender = value;
  }
}
