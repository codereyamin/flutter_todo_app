import 'package:flutter/widgets.dart';
import 'package:flutter_todo_app/app/modules/onboardScreen/models/on_board_data_model.dart';
import 'package:flutter_todo_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class OnboardScreenController extends GetxController {
  RxInt selectedIndex = RxInt(0);
  late PageController pageController =
      PageController(initialPage: selectedIndex.value);
  List<OnBoardDataModel> onBoardDataList = [
    OnBoardDataModel(
        imagePath: "assets/on_board_1.png",
        title: "Save time by tracking your studies",
        subTitle: "Schedule your classes, assignments, quizzes and more"),
    OnBoardDataModel(
        imagePath: "assets/on_board_2.png",
        title: "Stay on top of your education",
        subTitle: "Reduce your stress, increase your productivity"),
    OnBoardDataModel(
        imagePath: "assets/on_board_3.png",
        title: "Spend more time doing the things you love",
        subTitle: "Get started within five minutes"),
  ];

  changePage(int index) {
    selectedIndex.value = index;
    pageController.animateToPage(selectedIndex.value,
        duration: const Duration(seconds: 1), curve: Curves.ease);
  }

  nextPage() {
    if (selectedIndex.value != onBoardDataList.length - 1) {
      selectedIndex.value = selectedIndex.value + 1;
      changePage(selectedIndex.value);
    } else {
      Get.offAllNamed(Routes.HOME_SCREEN);
    }
  }

  previewPage() {
    selectedIndex.value = selectedIndex.value - 1;
    if (!selectedIndex.isNegative) {
      changePage(selectedIndex.value);
    }
  }
}
