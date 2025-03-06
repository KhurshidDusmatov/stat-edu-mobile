import 'package:get/get.dart';
import 'package:rttrm_task_app/controller/base/base_controller.dart';

class MainController extends BaseController{
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