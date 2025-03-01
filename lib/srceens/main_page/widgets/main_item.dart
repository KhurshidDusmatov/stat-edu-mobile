import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rttrm_task_app/utils/res_colors.dart';

BottomNavigationBarItem item(String label, String icon) {
  return BottomNavigationBarItem(
      label: label,
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: SvgPicture.asset(
          'assets/icons/$icon.svg',
          color: ResColors.lightGreyText,
          height: 25,
          width: 25,
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: SvgPicture.asset(
          color: ResColors.primaryColor,
          'assets/icons/$icon.svg',
          height: 25,
          width: 25,
        ),
      ));
}
