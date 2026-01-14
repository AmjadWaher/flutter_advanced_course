import 'package:completed_flutter_projects/core/helpers/extensions.dart';
import 'package:completed_flutter_projects/core/helpers/snack_bar.dart';
import 'package:completed_flutter_projects/core/routing/routes.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/features/signup/data/models/sign_up_response.dart';
import 'package:completed_flutter_projects/features/signup/logic/cubit/sign_up_cubit.dart';
import 'package:completed_flutter_projects/features/signup/logic/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen:
          (previous, current) =>
              current is Loading || current is Success || current is Error,
      listener: (context, state) {
        switch (state) {
          case Loading():
            showDialog(
              context: context,
              builder:
                  (context) => const Center(
                    child: CircularProgressIndicator(color: AppColors.mainBlue),
                  ),
            );
            break;

          case Success(:final data):
            final response = data as SignUpResponse;
            context.pop();
            setupSuccessState(context, response);
            context.pushNamed(Routes.loginScreen);
            break;

          case Error(:final message):
            setupErrorState(context, message);
            break;
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupSuccessState(BuildContext context, SignUpResponse response) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(snackBar(title: 'Successfully', content: response.message));
  }

  void setupErrorState(BuildContext context, String message) {
    context.pop();
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      snackBar(
        title: 'Error Occurred',
        content: message,
        backgroundColor: Colors.red,
        icon: Icons.error_outline,
      ),
    );
  }
}
