import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rttrm_task_app/controller/higher_edu/general/general_controller.dart';
import 'package:rttrm_task_app/view/higher_edu/widgets/bar_chart_widget.dart';
import 'package:rttrm_task_app/view/higher_edu/widgets/otm_map.dart';
import 'package:rttrm_task_app/view/higher_edu/widgets/page_data.dart';
import 'package:rttrm_task_app/view/higher_edu/widgets/pie_chart_widget.dart';
import 'package:rttrm_task_app/view/higher_edu/widgets/pie_gender_widget.dart';
import 'package:rttrm_task_app/view/higher_edu/widgets/statistic_card.dart';

class GeneralTab extends StatelessWidget {
  const GeneralTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(
      init: GeneralController(),
      builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 8),
              ...controller.statistics.map((text) => StatisticCard(text: text)).toList(),
              SizedBox(height: 12),
              PieChartWidget(title: "OTMlar soni mulkchilik shakli bo'yicha", data: controller.ownershipData),
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
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
