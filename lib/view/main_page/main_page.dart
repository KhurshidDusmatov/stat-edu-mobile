import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rttrm_task_app/controller/main/main_controller.dart';
import 'package:rttrm_task_app/view/doctorate/doctorate.dart';
import 'package:rttrm_task_app/view/higher_edu/higher_edu.dart';
import 'package:rttrm_task_app/view/higher_edu/widgets/custom_tab_bar.dart';
import 'package:rttrm_task_app/view/prof_edu/prof_edu.dart';
import 'package:rttrm_task_app/view/reception/reception.dart';

class MainPage extends StatelessWidget {
  final List<Widget> pages = [
    HigherEducationPage(),
    ProfEducationPage(),
    ReceptionPage(),
    DoctoratePage()
  ];

  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) => DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(controller.titles[controller.selectedIndex],
                style: TextStyle(fontSize: 19)),
            backgroundColor: Colors.white,
            bottom: controller.selectedIndex == 0
                ? PreferredSize(
                    preferredSize: Size.fromHeight(48),
                    child: CustomTabBar(),
                  )
                : PreferredSize(
                    preferredSize: Size.fromHeight(0),
                    child: SizedBox(),
                  ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Text(
                    "Statistika",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                _drawerItem("Oliy ta'lim", Icons.school, 0),
                _drawerItem("Professional ta'lim", Icons.business, 1),
                _drawerItem("Qabul", Icons.assignment, 2),
                _drawerItem("Doktorantura", Icons.local_hospital, 3),
              ],
            ),
          ),
          body: pages[controller.selectedIndex],
        ),
      ),
    );
  }

  Widget _drawerItem(String title, IconData icon, int index) {
    return GetBuilder<MainController>(
      builder: (controller) => ListTile(
        leading: Icon(icon,
            color:
                controller.selectedIndex == index ? Colors.blue : Colors.grey),
        title: Text(title,
            style: TextStyle(
                color: controller.selectedIndex == index
                    ? Colors.blue
                    : Colors.black)),
        onTap: () => controller.changePage(index),
      ),
    );
  }
}
