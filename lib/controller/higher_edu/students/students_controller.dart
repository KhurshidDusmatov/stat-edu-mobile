import 'package:get/get.dart';

class StudentsController extends GetxController {
  List<String> studentsData = [];

  @override
  void onInit() {
    super.onInit();
    fetchStudents();
  }

  void fetchStudents() async {
    await Future.delayed(Duration(seconds: 2)); // Fake API call
    Get.log("************************ Request *****************");
    studentsData = ["Student 1", "Student 2", "Student 3"];
    update();
  }
}
