import 'package:get/get.dart';
import 'package:rttrm_task_app/controller/base/base_controller.dart';

class StudentsController extends BaseController {
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
