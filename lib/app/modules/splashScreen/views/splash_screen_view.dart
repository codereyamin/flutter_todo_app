import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
          init: SplashScreenController(),
          builder: (context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Get.width / 10 * 3,
                    height: Get.width / 10 * 3,
                    child: const CircularProgressIndicator(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Loading....',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
