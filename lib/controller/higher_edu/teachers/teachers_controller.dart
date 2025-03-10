import 'package:get/get.dart';

class TeachersController extends GetxController {
  List<String> teachersData = [];

  @override
  void onInit() {
    super.onInit();
    fetchTeachers();
  }

  void fetchTeachers() async {
    await Future.delayed(Duration(seconds: 2)); // Fake API call
    Get.log("************************ Request *****************");
    teachersData = ["Teacher 1", "Teacher 2", "Teacher 3"];
    update();
  }
}
