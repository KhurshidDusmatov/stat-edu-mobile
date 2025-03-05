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

List<DChartBarDataCustom> barChartData2 = [
  DChartBarDataCustom(value: 1488438, label: 'Bakalavr', color: Color(0xffA1DD75)),
  DChartBarDataCustom(value: 38123, label: 'Magistratura', color: Color(0xffA1DD75)),
  DChartBarDataCustom(value: 5157, label: 'Ordinatura', color: Color(0xffA1DD75)),
];

List<DChartBarDataCustom> coursesData = [
  DChartBarDataCustom(value: 393384, label: '1-kurs', color: Color(0xffA1DD75)),
  DChartBarDataCustom(value: 374993, label: '2-kurs', color: Color(0xffA1DD75)),
  DChartBarDataCustom(value: 383524, label: '3-kurs', color: Color(0xffA1DD75)),
  DChartBarDataCustom(value: 269007, label: '4-kurs', color: Color(0xffA1DD75)),
  DChartBarDataCustom(value: 103142, label: '5-kurs', color: Color(0xffA1DD75)),
  DChartBarDataCustom(value: 7687, label: '6-kurs', color: Color(0xffA1DD75)),
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


final Map<String, Map<String, dynamic>> genderData = {
  "Jami": {
    "total": 1531718,
    "male": 47.29,
    "female": 52.71,
  },
  "Davlat": {
    "total": 981497,
    "male": 48.5,
    "female": 51.5,
  },
  "Nodavlat": {
    "total": 510841,
    "male": 46.0,
    "female": 54.0,
  },
  "Xorijiy": {
    "total": 39380,
    "male": 50.2,
    "female": 49.8,
  },
};

final Map<String, Map<String, dynamic>> paymentData = {
  "Jami": {
    "total": 1531737,
    "grant": 11.21,
    "contract": 88.79,
  },
  "Davlat": {
    "total": 981500,
    "grant": 16.89,
    "contract": 83.11,
  },
  "Nodavlat": {
    "total": 510856,
    "grant": 0.37,
    "contract": 99.63,
  },
  "Xorijiy": {
    "total": 39381,
    "grant": 10.26,
    "contract": 89.74,
  },
};


