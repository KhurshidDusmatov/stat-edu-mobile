import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';
import 'legend_item.dart';


class PieWidget extends StatefulWidget {
  final String title;
  final Map<String, dynamic> data;
  final String category1;
  final String category2;
  final Color color1;
  final Color color2;

  const PieWidget({
    super.key,
    required this.title,
    required this.data,
    required this.category1,
    required this.category2,
    this.color1 = Colors.blue,
    this.color2 = Colors.pink,
  });

  @override
  _PieWidgetState createState() => _PieWidgetState();
}

class _PieWidgetState extends State<PieWidget> {
  String selectedCategory = "Jami"; // Default kategoriya

  @override
  Widget build(BuildContext context) {
    final selectedData = widget.data[selectedCategory] ?? {};
    final List<OrdinalData> chartData = [
      OrdinalData(
        domain: widget.category1,
        measure: selectedData[widget.category1] ?? 0,
        color: widget.color1,
      ),
      OrdinalData(
        domain: widget.category2,
        measure: selectedData[widget.category2] ?? 0,
        color: widget.color2,
      ),
    ];

    return Column(
      children: [
        Container(
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
                child: Text(widget.title, style: TextStyle(fontSize: 13)),
              ),
              SizedBox(height: 10),
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
              Center(
                child: AspectRatio(
                  aspectRatio: 16 / 12,
                  child: Stack(
                    children: [
                      DChartPieO(
                        data: chartData,
                        customLabel: (ordinalData, index) {
                          return '${ordinalData.measure.toStringAsFixed(1)}%';
                        },
                        configRenderPie: ConfigRenderPie(
                          strokeWidthPx: 0,
                          arcWidth: 35,
                        ),
                      ),
                      Center(
                        child: Text(
                          "${selectedData['total'] ?? 0}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Column(
                  children: chartData.map((legend) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: LegendItem(
                        color: legend.color!,
                        label: legend.domain,
                        percentage: legend.measure.toString(),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

