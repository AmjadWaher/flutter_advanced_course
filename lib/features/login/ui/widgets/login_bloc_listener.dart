
import 'package:completed_flutter_projects/core/helpers/extensions.dart';
import 'package:completed_flutter_projects/core/routing/routes.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/features/login/logic/cubit/login_cubit.dart';
import 'package:completed_flutter_projects/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        switch (state) {
          case Loading():
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.mainBlue,
                ),
              ),
            );
            break;

          case Success(:final data):
            context.pop();
            context.pushNamed(Routes.mainHomeScreen);
            break;

          case Error(:final message):
            setupErrorState(context, message);
            break;

          default:
            break;
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String message) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => Center(
        child: AlertDialog(
          icon: const Icon(
            Icons.error,
            color: Colors.red,
            size: 32,
          ),
          content: Text(
            message,
            style: TextStyles.font15DarkBlueMedium,
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text(
                'Got it',
                style: TextStyles.font14MainBlueSemiBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
