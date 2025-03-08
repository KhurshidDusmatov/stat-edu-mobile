import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class BarChartWidget extends StatefulWidget {
  final String title;
  final double maxNumber;
  final List<Map<String, dynamic>> data;
  const BarChartWidget({
    super.key,
    required this.title,
    required this.maxNumber,
    required this.data,
  });

  @override
  _BarChartWidgetState createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {
  String selectedCategory = "Jami"; // Default holatda jami chiqadi

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.5,
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
            child: Text(widget.title, style: TextStyle(fontSize: 13)),
          ),
          // 🔹 Tugmalar (Jami, Davlat, Nodavlat, Xorijiy)
          Center(
            child: Wrap(
              spacing: 4.0,
              children: ["Jami", "Davlat", "Nodavlat", "Xorijiy"].map((category) {
                bool isSelected = selectedCategory == category;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                  child: Container(
                    width: 70,
                    height: 26,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue : Colors.grey[300],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        category,
                        style: TextStyle(
                          fontSize: 9,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          // 🔹 Bar Chart
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 16),
          //     child: DChartBarCustom(
          //       max: widget.maxNumber,
          //       showDomainLabel: true,
          //       showMeasureLabel: true,
          //       showMeasureLine: true,
          //       spaceMeasureLinetoChart: 12,
          //       measureLabelStyle: TextStyle(fontSize: 9, color: Colors.grey),
          //       measureLineStyle: BorderSide(color: Colors.grey),
          //       valueAlign: Alignment.bottomCenter,
          //       domainLabelStyle: TextStyle(fontSize: 7),
          //       radiusBar: BorderRadius.circular(6),
          //       // listData: getFilteredData(),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
