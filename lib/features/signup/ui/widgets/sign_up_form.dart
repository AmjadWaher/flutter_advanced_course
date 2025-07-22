import 'package:completed_flutter_projects/core/helpers/app_regex.dart';
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
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isValidName(value)) {
                return 'Please enter valid name';
              }
              return null;
            },
          ),
          verticalSpace(7),
          AppTextFormField(
            controller: context.read<SignUpCubit>().emailController,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isValidEmail(value)) {
                return 'Please enter valid email';
              }
              return null;
            },
          ),
          verticalSpace(7),
          AppTextFormField(
            controller: context.read<SignUpCubit>().phoneController,
            hintText: 'Your number',
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isValidPhoneNumber(value)) {
                return 'Please enter a valid phone number';
              }

              return null;
            },
          ),
          verticalSpace(7),
          GenderMenu(),
          verticalSpace(7),
          AppTextFormField(
            isObscureText: isPasswordVisible,
            controller: context.read<SignUpCubit>().passwordController,
            hintText: 'Password',
            keyboardType: TextInputType.visiblePassword,
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
          verticalSpace(7),
          AppTextFormField(
            isObscureText: isPasswordConfirmationVisible,
            controller:
                context.read<SignUpCubit>().passwordConfirmationController,
            hintText: 'Confirm Password',
            keyboardType: TextInputType.visiblePassword,
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
          verticalSpace(10),
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
