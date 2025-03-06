import 'package:get/get.dart';
import 'package:rttrm_task_app/controller/higher_edu/general/general_controller.dart';
import 'package:rttrm_task_app/controller/higher_edu/students/students_controller.dart';
import 'package:rttrm_task_app/controller/higher_edu/teachers/teachers_controller.dart';
import 'package:rttrm_task_app/controller/main/main_controller.dart';
import 'package:rttrm_task_app/data/server/api/api_service.dart';
import 'package:rttrm_task_app/data/server/auth_interceptor.dart';
import 'package:rttrm_task_app/data/storage/auth/auth_holder.dart';
import 'package:rttrm_task_app/data/storage/auth/auth_prefs.dart';

class DIService {
  static Future<void> init() async {
    Get.lazyPut<AuthHolder>(() => AuthPrefs(), fenix: true);
    Get.lazyPut<ApiService>(() => ApiService(Get.find<AuthInterceptor>()), fenix: true);
    Get.lazyPut<AuthInterceptor>(() => AuthInterceptor(Get.find<AuthHolder>()), fenix: true);

    /// controllers
    Get.lazyPut<MainController>(() => MainController(), fenix: true);
    Get.lazyPut<GeneralController>(() => GeneralController(), fenix: true);
    Get.lazyPut<StudentsController>(() => StudentsController(), fenix: true);
    Get.lazyPut<TeachersController>(() => TeachersController(), fenix: true);
    // Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    // Get.lazyPut<AddClubController>(() => AddClubController(), fenix: true);

    /// use case
  }
}
