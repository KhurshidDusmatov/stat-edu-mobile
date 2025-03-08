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
        return controller.isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 8),
                    ...controller.statistics
                        .map((text) => StatisticCard(text: text)),
                    SizedBox(height: 12),
                    PieChartWidget(
                        title: "OTMlar soni mulkchilik shakli bo'yicha",
                        controller: controller),
                    SizedBox(height: 12),
                    BarChartWidget(
                        title: "OTMlar soni tashkiliy turi bo'yicha",
                        barChartData: controller.uTypeChartList,
                        maxNumber: 150),
                    SizedBox(height: 12),
                    UzbekistanOTMMap(controller: controller),
                    SizedBox(height: 12),
                    PieWidget(
                      title: "Talabalar soni jins kesimida",
                      data: controller.genderData,
                      category1: "Erkaklar",
                      category2: "Ayollar",
                      color1: Colors.blue,
                      color2: Colors.pink,
                    ),
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
                    PieWidget(
                      title: "Talabalar soni to'lov shakli kesimida",
                      data:controller.grantData,
                      category1: "Davlat granti",
                      category2: "To'lov kontrakt",
                      color1: Colors.blue,
                      color2: Colors.pink,
                    ),
                    SizedBox(height: 12),
                    PieWidget(
                      title: "Professor-o'qituvchilar jins kesimida",
                      data:controller.teacherGenderData,
                      category1: "Erkaklar",
                      category2: "Ayollar",
                      color1: Colors.blue,
                      color2: Colors.pink,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              );
      },
    );
  }
}
