import 'package:get/get.dart';

class MainController extends GetxController{
  int selectedIndex = 0;

  final List<String> titles = [
    "Oliy ta'lim",
    "Professional ta'lim",
    "Qabul",
    "Doktorantura"
  ];

  void changePage(int index) {
    selectedIndex = index;
    update(); // UI ni yangilash
    Get.back(); // Drawer'ni yopish
  }
}