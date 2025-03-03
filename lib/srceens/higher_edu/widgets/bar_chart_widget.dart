import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';
import 'package:rttrm_task_app/srceens/higher_edu/widgets/page_data.dart';

class BarChartWidget extends StatelessWidget {
  final String title;

  const BarChartWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.8,
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
              aspectRatio: 16 / 9,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: DChartBarCustom(
                  max: 120,
                  showDomainLabel: true,
                  valueAlign: Alignment.bottomCenter,
                  domainLabelStyle: TextStyle(fontSize: 7),
                  radiusBar: BorderRadius.circular(6),
                  listData: barChartData,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
