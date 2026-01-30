import 'dart:developer';

import 'package:completed_flutter_projects/core/helpers/constants.dart';
import 'package:completed_flutter_projects/core/helpers/shared_pref_helper.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  Future<String> get getUserName async {
    return await SharedPrefHelper.getString(SharedPrefKeys.userName);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: getUserName,
              builder: (context, snapshot) {
                final name = snapshot.data ?? 'User';
                log(name);
                return Text('Hi, $name!', style: TextStyles.font18DarkBlueBold);
              },
            ),
            Text('How Are you Today?', style: TextStyles.font12GrayRegular),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 24,
          backgroundColor: AppColors.whiteSmoke,
          child: SvgPicture.asset('assets/svgs/notifications.svg'),
        ),
      ],
    );
  }
}
