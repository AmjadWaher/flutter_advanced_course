import 'package:completed_flutter_projects/core/helpers/spacing.dart';
import 'package:completed_flutter_projects/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });
  final String title;
  final String icon;
  final Color color;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: color.withAlpha(20),
            ),
            child: SvgPicture.asset(icon, height: 30, width: 30),
          ),
          title: Text(title, style: TextStyles.font14DarkBlueRegular),
          onTap: onTap,
        ),
        verticalSpace(16),
        Divider(color: Colors.grey[200], height: 1, indent: 16, endIndent: 16),
      ],
    );
  }
}
