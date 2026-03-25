import 'package:completed_flutter_projects/core/helpers/extensions.dart';
import 'package:completed_flutter_projects/core/helpers/shared_pref_helper.dart';
import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/routing/routes.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:completed_flutter_projects/features/profile/ui/widgets/profile_avatar.dart';
import 'package:completed_flutter_projects/features/profile/ui/widgets/white_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBlue,
      appBar: AppBar(
        title: Text('Profile', style: TextStyles.font18WhitSemiBold),
        backgroundColor: AppColors.mainBlue,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            color: Colors.white,
            onPressed: () async {
              _logout(context);
            },
          ),
        ],
      ),
      body: const Stack(
        clipBehavior: Clip.none,
        children: [WhiteCard(), ProfileAvatar()],
      ),
    );
  }

  void _logout(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (_) {
        return Center(
          child: Container(
            height: 190.h,
            width: 250.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(50),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
                BoxShadow(
                  color: Colors.black.withAlpha(50),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Logout', style: TextStyles.font18Black87Bold),
                verticalSpace(12),
                Text(
                  'Are you sure you want to logout?',
                  style: TextStyles.font16Black54Regular,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                      ),
                      child: Text('No', style: TextStyles.font14BlackRegular),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        context.pop();
                        await SharedPrefHelper.removeAllData();
                        await SharedPrefHelper.removeAllSecuredData();
                        if (context.mounted) {
                          context.pushNamedAndRemoveUntil(
                            Routes.loginScreen,
                            predicate: (route) => false,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.mainBlue,
                      ),
                      child: Text('Yes', style: TextStyles.font14WhiteRegular),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
