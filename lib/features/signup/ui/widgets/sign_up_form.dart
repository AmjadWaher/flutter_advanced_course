import 'package:completed_flutter_projects/core/helpers/app_regex.dart';
import 'package:completed_flutter_projects/core/helpers/snack_bar.dart';
import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/widgets/app_text_form_field.dart';
import 'package:completed_flutter_projects/features/signup/ui/widgets/password_validations.dart';
import 'package:completed_flutter_projects/features/signup/logic/cubit/sign_up_cubit.dart';
import 'package:completed_flutter_projects/features/signup/ui/widgets/gender_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isPasswordVisible = true;
  bool isPasswordConfirmationVisible = true;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<SignUpCubit>().nameController,
            hintText: 'Username',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isValidName(value)) {
                return 'Please enter valid name';
              }
              return null;
            },
          ),
          verticalSpace(10),
          AppTextFormField(
            controller: context.read<SignUpCubit>().emailController,
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isValidEmail(value)) {
                return 'Please enter valid email';
              }
              return null;
            },
          ),
          verticalSpace(10),
          AppTextFormField(
            controller: context.read<SignUpCubit>().phoneController,
            hintText: 'Your number',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isValidPhoneNumber(value)) {
                return 'Please enter a valid phone number';
              }

              return null;
            },
          ),
          verticalSpace(10),
          GenderMenu(),
          verticalSpace(10),
          AppTextFormField(
            isObscureText: isPasswordVisible,
            controller: context.read<SignUpCubit>().passwordController,
            hintText: 'Password',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isValidPassword(value)) {
                return 'Please enter valid password';
              }

              return null;
            },
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
              icon: Icon(
                isPasswordVisible ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          verticalSpace(10),
          AppTextFormField(
            isObscureText: isPasswordConfirmationVisible,
            controller:
                context.read<SignUpCubit>().passwordConfirmationController,
            hintText: 'Confirm Password',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !(context.read<SignUpCubit>().passwordController.text ==
                      value)) {
                return 'not match';
              }
            },
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isPasswordConfirmationVisible =
                      !isPasswordConfirmationVisible;
                });
              },
              icon: Icon(
                isPasswordConfirmationVisible
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
          ),
          verticalSpace(12),
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacter: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
