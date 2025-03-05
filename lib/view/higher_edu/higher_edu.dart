import 'package:flutter/material.dart';
import 'package:rttrm_task_app/view/doctorate/doctorate.dart';
import 'package:rttrm_task_app/view/higher_edu/widgets/custom_tab_bar.dart';
import 'package:rttrm_task_app/view/prof_edu/prof_edu.dart';
import 'package:rttrm_task_app/view/reception/reception.dart';
import 'widgets/otm_map.dart';
import 'widgets/page_data.dart';
import 'widgets/bar_chart_widget.dart';
import 'widgets/pie_chart_widget.dart';
import 'widgets/pie_gender_widget.dart';
import 'widgets/statistic_card.dart';

class HigherEducationPage extends StatefulWidget {
  const HigherEducationPage({super.key});

  @override
  State<HigherEducationPage> createState() => _HigherEducationPageState();
}

class _HigherEducationPageState extends State<HigherEducationPage> {
  int _selectedIndex = 0;

  final List<String> _titles = [
    "Oliy ta'lim",
    "Prof ta'lim",
    "Qabul",
    "Doktorantura"
  ];

  final List<Widget> _pages = [
    HigherEducationContent(),
    ProfEducationPage(),
    ReceptionPage(),
    DoctoratePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pop(context); // Drawer'ni yopish
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_titles[_selectedIndex], style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700)),
          backgroundColor: Colors.white,
          bottom: _selectedIndex == 0
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
        body: _pages[_selectedIndex],
      ),
    );
  }

  Widget _drawerItem(String title, IconData icon, int index) {
    return ListTile(
      leading: Icon(icon,
          color: _selectedIndex == index ? Colors.blue : Colors.grey),
      title: Text(title,
          style: TextStyle(
              color: _selectedIndex == index ? Colors.blue : Colors.black)),
      onTap: () => _onItemTapped(index),
    );
  }
}

class HigherEducationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 8),
              ...statistics.map((text) => StatisticCard(text: text)).toList(),
              SizedBox(height: 12),
              PieChartWidget(title: "OTMlar soni mulkchilik shakli bo'yicha"),
              SizedBox(height: 12),
              BarChartWidget(
                  title: "OTMlar soni tashkiliy turi bo'yicha",
                  barChartData: barChartData,
                  maxNumber: 120),
              SizedBox(height: 12),
              UzbekistanOTMMap(),
              SizedBox(height: 12),
              PieGenderWidget(
                  data: genderData,
                  isByGender: true,
                  text: "Talabalar soni jins kesimida"),
              SizedBox(height: 12),
              BarChartWidget(
                  title: "Talabalar soni ta'lim turi kesimida",
                  barChartData: barChartData2,
                  maxNumber: 1500000),
              SizedBox(height: 12),
              BarChartWidget(
                  title: "Talabalar soni kurslar kesimida",
                  barChartData: coursesData,
                  maxNumber: 400000),
              SizedBox(height: 12),
              PieGenderWidget(
                  data: paymentData,
                  isByGender: false,
                  text: "Talabalar soni to'lov shakli kesimida"),
              SizedBox(height: 80),
            ],
          ),
        ),
        Center(child: Text("Talabalar")),
        Center(child: Text("O'qituvchilar")),
      ],
    );
  }
}
