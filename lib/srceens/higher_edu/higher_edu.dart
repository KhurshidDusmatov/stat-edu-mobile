import 'package:flutter/material.dart';
import 'package:rttrm_task_app/srceens/higher_edu/widgets/custom_tab_bar.dart';
import 'widgets/otm_map.dart';
import 'widgets/page_data.dart';
import 'widgets/bar_chart_widget.dart';
import 'widgets/pie_chart_widget.dart';
import 'widgets/pie_gender_widget.dart';
import 'widgets/statistic_card.dart';


class HigherEducationPage extends StatelessWidget {
  const HigherEducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Oliy ta'lim"),
          backgroundColor: Colors.white,
          bottom: CustomTabBar()
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 8),
                  ...statistics.map((text) => StatisticCard(text: text)).toList(),
                  SizedBox(height: 12),
                  PieChartWidget(title: "OTMlar soni mulkchilik shakli bo'yicha"),
                  SizedBox(height: 12),
                  BarChartWidget(title: "OTMlar soni tashkiliy turi bo'yicha", barChartData: barChartData, maxNumber: 120),
                  SizedBox(height: 12),
                  UzbekistanOTMMap(),
                  SizedBox(height: 12),
                  PieGenderWidget(data: genderData, isByGender: true, text: "Talabalar soni jins kesimida"),
                  SizedBox(height: 12),
                  BarChartWidget(title: "Talabalar soni ta'lim turi kesimida", barChartData: barChartData2, maxNumber: 1500000),
                  SizedBox(height: 12),
                  BarChartWidget(title: "Talabalar soni kurslar kesimida", barChartData: coursesData, maxNumber: 400000),
                  SizedBox(height: 12),
                  PieGenderWidget(data: paymentData, isByGender: false, text: "Talabalar soni to'lov shakli kesimida"),
                  SizedBox(height: 80),
                ],
              ),
            ),
            Center(child: Text("Talabalar")),
            Center(child: Text("O'qituvchilar")),
            Center(child: Text("OTMlar ro'yxati")),
            Center(child: Text("Jadvallar")),
          ],
        ),
      ),
    );
  }
}
