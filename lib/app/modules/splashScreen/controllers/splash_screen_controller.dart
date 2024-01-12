import 'package:flutter_todo_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreenController extends GetxController {
  final box = GetStorage();
  final String onBoardDataKey = "onBoardDataKey";
  gotoNextPage() async {
    await Future.delayed(const Duration(seconds: 2));
    final data = box.read(onBoardDataKey);
    if (data != null) {
      Get.offAllNamed(Routes.HOME_SCREEN);
    } else {
      await box.write(onBoardDataKey, false);
      Get.offAllNamed(Routes.ONBOARD_SCREEN);
    }
  }

  @override
  void onInit() {
    gotoNextPage();
    super.onInit();
  }
}
