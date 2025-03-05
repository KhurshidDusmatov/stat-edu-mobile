import 'package:flutter/material.dart';
import 'package:rttrm_task_app/data/tools/const/res_colors.dart';
import 'package:rttrm_task_app/view/doctorate/doctorate.dart';
import 'package:rttrm_task_app/view/higher_edu/higher_edu.dart';
import 'package:rttrm_task_app/view/prof_edu/prof_edu.dart';
import 'package:rttrm_task_app/view/reception/reception.dart';

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

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      Navigator.pop(context); // Drawer'ni yopish
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Main Page"),
        backgroundColor: ResColors.primaryColor,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: ResColors.primaryColor),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            _drawerItem("Oliy ta'lim", Icons.school, 0),
            _drawerItem("Prof ta'lim", Icons.business, 1),
            _drawerItem("Qabul", Icons.assignment, 2),
            _drawerItem("Doktorantura", Icons.local_hospital, 3),
          ],
        ),
      ),
      body: _pages[_currentIndex],
    );
  }

  Widget _drawerItem(String title, IconData icon, int index) {
    return ListTile(
      leading: Icon(icon, color: _currentIndex == index ? ResColors.primaryColor : Colors.grey),
      title: Text(title, style: TextStyle(color: _currentIndex == index ? ResColors.primaryColor : Colors.black)),
      onTap: () => _onItemTapped(index),
    );
  }
}

