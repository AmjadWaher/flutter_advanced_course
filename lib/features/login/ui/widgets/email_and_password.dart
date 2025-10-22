import 'package:completed_flutter_projects/core/helpers/app_regex.dart';
import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/widgets/app_text_form_field.dart';
import 'package:completed_flutter_projects/features/login/logic/cubit/login_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatelessWidget {
  const EmailAndPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: cubit.emailController,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isValidEmail(value)) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          verticalSpace(17),
          // Use ValueListenableBuilder for password field
          ValueListenableBuilder(
            valueListenable: cubit.isVisible,
            builder: (context, isVisible, _) {
              return AppTextFormField(
                controller: cubit.passwordController,
                hintText: 'Password',
                isObscureText: isVisible,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: GestureDetector(
                  onTap: () {
                    cubit.togglePasswordVisibility();
                  },
                  child: Icon(
                    isVisible ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (!AppRegex.isValidPassword(value)) {
                    return '';
                  }
                  return null;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
