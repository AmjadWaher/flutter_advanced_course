import 'package:completed_flutter_projects/core/di/dependence_injection.dart';
import 'package:completed_flutter_projects/core/helpers/constants.dart';
import 'package:completed_flutter_projects/core/helpers/extensions.dart';
import 'package:completed_flutter_projects/core/helpers/shared_pref_helper.dart';
import 'package:completed_flutter_projects/core/routing/app_router.dart';
import 'package:completed_flutter_projects/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpGetIt();
  // to fix texts being hidden font bug in flutter_screenutil in release mode
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  await checkIfLoggedInUser();

  Stripe.publishableKey =
      "pk_test_51SHSmPCo2yKmmtVvUycz63KcGAShoTd7eviUWgHdjYvk7XBxqmPzvdN2oSeeuUo69mHxgcFwyYooC5SIJTBtQwm000JScihFKc";
  await Stripe.instance.applySettings();

  runApp(DocApp(appRouter: AppRouter()));
}

Future<void> checkIfLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
