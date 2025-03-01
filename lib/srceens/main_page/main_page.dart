import 'package:flutter/material.dart';
import 'package:rttrm_task_app/srceens/doctorate/doctorate.dart';
import 'package:rttrm_task_app/srceens/higher_edu/higher_edu.dart';
import 'package:rttrm_task_app/srceens/main_page/widgets/main_item.dart';
import 'package:rttrm_task_app/srceens/prof_edu/prof_edu.dart';
import 'package:rttrm_task_app/srceens/reception/reception.dart';
import 'package:rttrm_task_app/utils/res_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HigherEducationPage(),
    ProfEducationPage(),
    ReceptionPage(),
    DoctoratePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        height: 62,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(11)),
          boxShadow: [
            BoxShadow(
              color: ResColors.blackWithOpacity,
              blurRadius: 1.2,
              spreadRadius: 0.3,
            )
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: ResColors.whiteColor,
          elevation: 0,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ResColors.primaryColor,
          selectedFontSize: 12,
          unselectedFontSize: 11.4,
          unselectedItemColor: ResColors.lightGreyText,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            item(
              "Oliy ta'lim",
              "home_icon",
            ),
            item(
              "Proff ta'lim",
              "prof_icon",
            ),
            item(
              "Qabul",
              "reception_icon",
            ),
            item(
              "Doktorantura",
              "doctorate_icon",
            ),
          ],
        ),
      ),
    );
  }
}
