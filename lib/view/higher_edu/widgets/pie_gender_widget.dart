import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';

import 'legend_item.dart';

class PieGenderWidget extends StatefulWidget {
  final String text;
  final Map<String, Map<String, dynamic>> data;
  final bool isByGender;
  const PieGenderWidget({super.key, required this.text, required this.data, required this.isByGender});

  @override
  _PieGenderWidgetState createState() => _PieGenderWidgetState();
}

class _PieGenderWidgetState extends State<PieGenderWidget> {
  String selectedCategory = "Jami"; // Default tanlangan kategoriya

  // Ma'lumotlar

  @override
  Widget build(BuildContext context) {
    final selectedData = widget.data[selectedCategory]!;

    final List<OrdinalData> chartData = [
      OrdinalData(
          domain: widget.isByGender ? "Erkaklar" : "Davlat granti",
          measure: widget.isByGender ? selectedData["male"] : selectedData["grant"],
          color: Colors.blue),
      OrdinalData(
          domain:  widget.isByGender ? "Ayollar" : "To'lov kontrakt",
          measure: widget.isByGender ? selectedData["female"] : selectedData["contract"],
          color: Colors.pink),
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
                child: Text(widget.text,
                    style: TextStyle(fontSize: 13)),
              ),
              SizedBox(height: 10),
              Center(
                child: Wrap(
                  spacing: 4.0,
                  children:
                      ["Jami", "Davlat", "Nodavlat", "Xorijiy"].map((category) {
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
                          return '${ordinalData.measure}%';
                        },
                        configRenderPie: ConfigRenderPie(
                          strokeWidthPx: 0,
                          arcWidth: 35,
                        ),
                      ),
                      Center(
                        child: Text(
                          "${selectedData['total']}",
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
                        color: (legend.domain == "Erkaklar" || legend.domain == "Davlat granti")
                            ? Colors.blue
                            : Colors.pink,
                        label: legend.domain,
                        percentage: "${legend.measure}%",
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
