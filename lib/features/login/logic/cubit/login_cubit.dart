import 'package:completed_flutter_projects/core/networking/api_result.dart'
    as api_result;
import 'package:completed_flutter_projects/features/login/data/models/login_request_body.dart';
import 'package:completed_flutter_projects/features/login/data/repository/login_repository.dart';
import 'package:completed_flutter_projects/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _loginRepository;
  LoginCubit(this._loginRepository) : super(const LoginState.initial());

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepository.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    switch (response) {
      case api_result.Success(:final data):
        emit(LoginState.success(data));
        break;

      case api_result.Failure(:final error):
        emit(LoginState.error(message: error.apiErrorModel.message ?? ''));
        break;
    }
  }
}
