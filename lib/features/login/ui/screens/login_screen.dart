import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/core/widgets/app_text_button.dart';

import 'package:completed_flutter_projects/features/login/logic/cubit/login_cubit.dart';
import 'package:completed_flutter_projects/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:completed_flutter_projects/features/login/ui/widgets/email_and_password.dart';
import 'package:completed_flutter_projects/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:completed_flutter_projects/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 50.h),
          child: Align(
            alignment: AlignmentDirectional.center,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back',
                    style: TextStyles.font24BlueBold,
                  ),
                  verticalSpace(8),
                  Text(
                    'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                    style: TextStyles.font14GrayRegular,
                  ),
                  verticalSpace(36),
                  Column(
                    children: [
                      const EmailAndPassword(),
                      verticalSpace(15),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyles.font13MainBlueRegular,
                        ),
                      ),
                      verticalSpace(30),
                      AppTextButton(
                        buttonText: 'Login',
                        onPressed: () {
                          validateThenDologin(context);
                        },
                        textStyle: TextStyles.font16WhiteSemiBold,
                      ),
                      verticalSpace(20),
                      const TermsAndConditionsText(),
                      verticalSpace(20),
                      const DontHaveAccountText(),
                      const LoginBlocListener(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDologin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
