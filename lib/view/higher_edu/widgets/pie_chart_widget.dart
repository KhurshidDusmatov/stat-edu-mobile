import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';
import 'package:rttrm_task_app/controller/higher_edu/general/general_controller.dart';
import 'legend_item.dart';

class PieChartWidget extends StatelessWidget {
  final String title;
  final GeneralController controller;

  const PieChartWidget({super.key, required this.title, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width - 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(title, style: TextStyle(fontSize: 13)),
          ),
          Center(
            child: AspectRatio(
              aspectRatio: 16 / 12,
              child: Stack(
                children: [
                  DChartPieO(
                    data: controller.ordinalDataList,
                    customLabel: (ordinalData, index) {
                      return '${ordinalData.measure}%';
                    },
                    configRenderPie: ConfigRenderPie(
                      strokeWidthPx: 0,
                      arcWidth: 35,
                    ),
                  ),
                  Center(
                    child: Text(controller.otmCount.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Column(
              children: controller.ordinalDataList
                  .map((item) => Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: LegendItem(
                                    color: item.color!,
                                    label: item.domain,
                                    percentage: item.measure.toString(),
                                  ),
                  ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
