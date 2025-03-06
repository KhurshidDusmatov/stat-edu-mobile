import 'package:get/get.dart';
import 'package:rttrm_task_app/controller/base/base_controller.dart';

class GeneralController extends BaseController{
  List<String> statistics = [
    "OTMlar soni: 208",
    "Professor-o'qituvchilar soni: 44910",
    "Talabalar soni: 1532340"
  ];

  @override
  void onInit() {
    super.onInit();
    fetchStatistics();
  }

  void fetchStatistics() async {
    // API so‘rov
    await Future.delayed(Duration(seconds: 1));
    Get.log("************************ Request *****************");
    update();
  }
}