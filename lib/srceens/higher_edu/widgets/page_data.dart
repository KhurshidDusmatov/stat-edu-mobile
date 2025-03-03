import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';

List<OrdinalData> ordinalDataList = [
  OrdinalData(domain: 'A', measure: 51, color: Color(0xff43B1A0)),
  OrdinalData(domain: 'B', measure: 33, color: Color(0xff4DA2F1)),
  OrdinalData(domain: 'C', measure: 14, color: Color(0xffFFD426)),
];

List<DChartBarDataCustom> barChartData = [
  DChartBarDataCustom(value: 1, label: 'Konservatoriya', color: Color(0xffA1DD75)),
  DChartBarDataCustom(value: 5, label: 'Akademiya', color: Color(0xffA1DD75)),
  DChartBarDataCustom(value: 40, label: 'Filial', color: Color(0xffA1DD75)),
  DChartBarDataCustom(value: 53, label: 'Institut', color: Color(0xffA1DD75)),
  DChartBarDataCustom(value: 109, label: 'Universitet', color: Color(0xffA1DD75)),
];

List<String> statistics = [
  "OTMlar soni: 208",
  "Professor-o'qituvchilar soni: 44910",
  "Talabalar soni: 1532340"
];

List<Map<String, dynamic>> legends = [
  {"color": Color(0xff43B1A0), "label": "Davlat", "percentage": "51.92%"},
  {"color": Color(0xff4DA2F1), "label": "Nodavlat", "percentage": "33.65%"},
  {"color": Color(0xffFFD426), "label": "Xorijiy", "percentage": "14.42%"},
];
