import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rttrm_task_app/data/server/api/api_service.dart';
import 'package:rttrm_task_app/data/tools/const/string.dart';
import 'package:rttrm_task_app/data/tools/service/connectivity_service/connection.dart';
import 'package:rttrm_task_app/domain/data/ownership/ownership_data.dart';

class GeneralController extends GetxController {
  bool isLoading = false;
  int otmCount = 0;
  int studentsCount = 0;
  int teachersCount = 0;
  List<String> statistics = [];
  List<OrdinalData> ordinalDataList = [];
  List<DChartBarDataCustom> uTypeChartList = [];
  List<Map<String, dynamic>> regions = [];
  Map<String, Map<String, dynamic>> genderData = {};
  Map<String, Map<String, dynamic>> grantData = {};
  Map<String, Map<String, dynamic>> teacherGenderData = {};
  GeneralController();

  @override
  void onInit() {
    super.onInit();
    getOwnership();
    getUniversityType();
    getUniversityCountByRegion();
    getStudentsByGenderAndPaymentType();
    getTeachersByGender();
  }

  Future<void> getOwnership() async {
    if (await CheckNet().checkInternet() == false) {
      Get.snackbar(Strings.appName, Strings.noInternet);
      return;
    }

    isLoading = true;
    update();

    try {
      List<ResponseData> ownershipData = await Get.find<ApiService>().getOwnership();
      otmCount = ownershipData.fold(0, (sum, item) => sum + item.count);

      List<Color> colors = [
        Color(0xff43B1A0),
        Color(0xff4DA2F1),
        Color(0xffFFD426)
      ];
      ordinalDataList = ownershipData.asMap().entries.map((entry) {
        String name = entry.value.name;
        int count = entry.value.count;
        double percentage = (count / otmCount) * 100; // Foizni hisoblash
        return OrdinalData(
          domain: name,
          measure: double.parse(percentage.toStringAsFixed(2)),
          // 51.92% formatda olish
          color: colors[entry.key],
        );
      }).toList();

      statistics = [
        "OTMlar soni: $otmCount",
        "Professor-o‘qituvchilar soni: $teachersCount",
        "Talabalar soni: $studentsCount"
      ];
    } catch (e) {
      print("Error loading ownership data: $e");
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> getUniversityType() async {
    if (await CheckNet().checkInternet() == false) {
      Get.snackbar(Strings.appName, Strings.noInternet);
      return;
    }
    isLoading = true;
    update();

    try {
      List<ResponseData> uTypeList = await Get.find<ApiService>().getUniversityType();
      uTypeChartList = uTypeList.asMap().entries.map((entry) {
        return DChartBarDataCustom(
            value: entry.value.count.toDouble(),
            label: entry.value.name,
            color: Color(0xffA1DD75));
      }).toList();
    } catch (e) {
      print("Error loading ownership data: $e");
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> getUniversityCountByRegion() async {
    if (await CheckNet().checkInternet() == false) {
      Get.snackbar(Strings.appName, Strings.noInternet);
      return;
    }

    isLoading = true;
    update();

    try {
      List<ResponseData> regionsList = await Get.find<ApiService>().getUniversityRegion();
      regions = [
        {"name": "Qoraqalpog‘iston Resp.", "lat": 42.4610, "lng": 59.6170, "otm": 0},
        {"name": "Navoiy viloyati", "lat": 40.0844, "lng": 65.3792, "otm": 0},
        {"name": "Xorazm viloyati", "lat": 41.3565, "lng": 60.8567, "otm": 0},
        {"name": "Buxoro viloyati", "lat": 39.7686, "lng": 64.4556, "otm": 0},
        {"name": "Qashqadaryo viloyati", "lat": 38.8610, "lng": 65.7847, "otm": 0},
        {"name": "Surxondaryo viloyati", "lat": 37.9405, "lng": 67.5707, "otm": 0},
        {"name": "Samarqand viloyati", "lat": 39.6542, "lng": 66.9756, "otm": 0},
        {"name": "Jizzax viloyati", "lat": 40.1250, "lng": 67.8800, "otm": 0},
        {"name": "Sirdaryo viloyati", "lat": 40.4973, "lng": 68.7803, "otm": 0},
        {"name": "Toshkent viloyati", "lat": 41.2000, "lng": 69.7000, "otm": 0},
        {"name": "Namangan viloyati", "lat": 41.0000, "lng": 71.6000, "otm": 0},
        {"name": "Andijon viloyati", "lat": 40.7833, "lng": 72.3500, "otm": 0},
        {"name": "Farg‘ona viloyati", "lat": 40.3864, "lng": 71.7864, "otm": 0},
        {"name": "Toshkent shahri", "lat": 41.2995, "lng": 69.2401, "otm": 0},
      ];
      for (var region in regionsList) {
        String name = region.name;
        int count = region.count;
        var matchingRegion = regions.firstWhere(
              (r) => r["name"] == name,
          orElse: () => {},
        );

        if (matchingRegion.isNotEmpty) {
          matchingRegion["otm"] = count;
        }
      }
    } catch (e) {
      print("Error loading regions data: $e");
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> getStudentsByGenderAndPaymentType() async {
    if (await CheckNet().checkInternet() == false) {
      Get.snackbar(Strings.appName, Strings.noInternet);
      return;
    }

    isLoading = true;
    update();

    try {
      var genderDataApi = await Get.find<ApiService>().getOwnershipAndGender();
      var grantDataApi = await Get.find<ApiService>().getOwnershipAndPaymentType();

      int totalMale = 0;
      int totalFemale = 0;
      int totalGrant = 0;
      int totalContract = 0;

      Map<String, Map<String, dynamic>> pieDataGender = {};
      Map<String, Map<String, dynamic>> pieDataGrant = {};

      for (var data in genderDataApi) {
        String ownership = data.ownership!;
        int maleCount = data.maleCount!;
        int femaleCount = data.femaleCount!;
        int total = maleCount + femaleCount;

        totalMale += maleCount;
        totalFemale += femaleCount;

        pieDataGender[ownership] = {
          "total": total,
          "Erkaklar": (maleCount / total) * 100,
          "Ayollar": (femaleCount / total) * 100,
        };
      }

      for (var data in grantDataApi) {
        String ownership = data.ownership!;
        int grantCount = data.grandCount!;
        int contractCount = data.contractCount!;
        int total = grantCount + contractCount;

        totalGrant += grantCount;
        totalContract += contractCount;

        pieDataGrant[ownership] = {
          "total": total,
          "Davlat granti": (grantCount / total) * 100,
          "To'lov kontrakt": (contractCount / total) * 100,
        };
      }

      int studentsCount = totalMale + totalFemale;
      pieDataGender["Jami"] = {
        "total": studentsCount,
        "Erkaklar": (totalMale / studentsCount) * 100,
        "Ayollar": (totalFemale / studentsCount) * 100,
      };

      pieDataGrant["Jami"] = {
        "total": totalGrant + totalContract,
        "Davlat granti": (totalGrant / (totalGrant + totalContract)) * 100,
        "To'lov kontrakt": (totalContract / (totalGrant + totalContract)) * 100,
      };

      statistics = [
        "OTMlar soni: $otmCount",
        "Professor-o‘qituvchilar soni: $teachersCount",
        "Talabalar soni: $studentsCount"
      ];

      genderData = pieDataGender;
      grantData = pieDataGrant;

    } catch (e) {
      print("Error loading pie data: $e");
    } finally {
      isLoading = false;
      update();
    }
  }


  Future<void> getTeachersByGender() async {
    if (await CheckNet().checkInternet() == false) {
      Get.snackbar(Strings.appName, Strings.noInternet);
      return;
    }

    isLoading = true;
    update();

    try {
      var genderDataApi = await Get.find<ApiService>().getTeacherOwnershipAndGender();
      int totalMale = 0;
      int totalFemale = 0;

      Map<String, Map<String, dynamic>> pieDataGender = {};

      for (var data in genderDataApi) {
        String ownership = data.ownership!;
        int maleCount = data.maleCount!;
        int femaleCount = data.femaleCount!;
        int total = maleCount + femaleCount;

        totalMale += maleCount;
        totalFemale += femaleCount;

        pieDataGender[ownership] = {
          "total": total,
          "Erkaklar": (maleCount / total) * 100,
          "Ayollar": (femaleCount / total) * 100,
        };
      }

      teachersCount = totalMale + totalFemale;
      pieDataGender["Jami"] = {
        "total": teachersCount,
        "Erkaklar": (totalMale / teachersCount) * 100,
        "Ayollar": (totalFemale / teachersCount) * 100,
      };
      statistics = [
        "OTMlar soni: $otmCount",
        "Professor-o‘qituvchilar soni: $teachersCount",
        "Talabalar soni: $studentsCount"
      ];
      teacherGenderData = pieDataGender;
    } catch (e) {
      print("Error loading pie data: $e");
    } finally {
      isLoading = false;
      update();
    }
  }

}
