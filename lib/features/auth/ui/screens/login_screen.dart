import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/core/widgets/app_text_button.dart';
import 'package:completed_flutter_projects/core/widgets/app_text_form_field.dart';
import 'package:completed_flutter_projects/features/auth/ui/widgets/already_have_account_text.dart';
import 'package:completed_flutter_projects/features/auth/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 50.h),
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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AppTextFormField(hintText: 'Email'),
                      verticalSpace(17),
                      AppTextFormField(
                        hintText: 'Password',
                        isObscureText: isVisible,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          child: Icon(
                            isVisible ? Icons.visibility_off : Icons.visibility,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(20),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyles.font13MainBlueRegular,
                  ),
                ),
                verticalSpace(40),
                AppTextButton(
                  buttonText: 'Login',
                  onPressed: () {},
                  textStyle: TextStyles.font16WhiteSemiBold,
                ),
                verticalSpace(20),
                const TermsAndConditionsText(),
                verticalSpace(30),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: const AlreadyHaveAccountText(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
