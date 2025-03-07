import 'package:get/get.dart';
import 'package:rttrm_task_app/controller/base/base_controller.dart';
import 'package:rttrm_task_app/data/server/api/api_service.dart';
import 'package:rttrm_task_app/data/tools/const/string.dart';
import 'package:rttrm_task_app/data/tools/service/connectivity_service/connection.dart';
import 'package:rttrm_task_app/domain/data/ownership/ownership_data.dart';

class GeneralController extends BaseController {
  bool isLoading = false;
  int otmCount = 0;
  List<OwnershipData> ownershipData = [];
  List<String> statistics = [];

  GeneralController();

  @override
  void onInit() {
    super.onInit();
    fetchOwnership();
  }

  Future<void> fetchOwnership() async {
    if (await CheckNet().checkInternet() == false) {
      Get.snackbar(Strings.appName, Strings.noInternet);
      return;
    }

    isLoading = true;
    update();

    try {
      ownershipData = await Get.find<ApiService>().getOwnership();

      otmCount = ownershipData.fold(0, (sum, item) => sum + item.count);

      statistics = [
        "OTMlar soni: $otmCount",
        "Professor-o‘qituvchilar soni: 44910",
        "Talabalar soni: 1532340"
      ];
    } catch (e) {
      print("Error loading ownership data: $e");
    } finally {
      isLoading = false;
      update();
    }
  }
}
