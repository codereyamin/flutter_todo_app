import 'package:flutter/material.dart';
import 'package:flutter_todo_app/app/modules/onboardScreen/models/on_board_data_model.dart';
import 'package:flutter_todo_app/widgets/app_text.dart';

import 'package:get/get.dart';

import '../controllers/onboard_screen_controller.dart';

class OnboardScreenView extends GetView<OnboardScreenController> {
  const OnboardScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: OnboardScreenController(),
        builder: (context) {
          return Scaffold(
            body: PageView.builder(
              itemCount: controller.onBoardDataList.length,
              controller: controller.pageController,
              onPageChanged: controller.changePage,
              itemBuilder: (context, index) {
                OnBoardDataModel item = controller.onBoardDataList[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      item.imagePath,
                      width: Get.width / 10 * 8,
                      height: Get.width / 10 * 8,
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          AppText(
                            text: item.title,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AppText(
                            text: item.subTitle,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Obx(
                () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: controller.selectedIndex.value == 0
                            ? null
                            : () {
                                controller.previewPage();
                              },
                        child: controller.selectedIndex.value == 0
                            ? const AppText(
                                text: "PreView",
                                color: Colors.transparent,
                              )
                            : const AppText(text: "PreView"),
                      ),
                      Row(
                          children: List.generate(
                              controller.onBoardDataList.length,
                              (index) => Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: AnimatedContainer(
                                      duration: const Duration(seconds: 1),
                                      width: controller.selectedIndex.value ==
                                              index
                                          ? 40
                                          : 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: Theme.of(Get.context!)
                                              .primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                  ))),
                      InkWell(
                        onTap: () {
                          controller.nextPage();
                        },
                        child: controller.selectedIndex.value !=
                                controller.onBoardDataList.length - 1
                            ? const AppText(
                                text: "Next",
                              )
                            : const AppText(text: "Done"),
                      ),
                    ]),
              ),
            ),
          );
        });
  }
}
