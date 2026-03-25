import 'package:completed_flutter_projects/core/helpers/user_name_listener.dart';
import 'package:completed_flutter_projects/core/themes/app_colors.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: UserNameListener.userNameNotifier,
      builder: (context, name, child) {
        return Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hi, $name!', style: TextStyles.font18DarkBlueBold),
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
      },
    );
  }
}
