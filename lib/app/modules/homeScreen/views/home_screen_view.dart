import 'package:flutter/material.dart';
import 'package:flutter_todo_app/app/modules/homeScreen/widgets/bottom_sheet.dart';
import 'package:flutter_todo_app/app/modules/homeScreen/widgets/home_screen_cart.dart';
import 'package:flutter_todo_app/widgets/app_text.dart';

import 'package:get/get.dart';

import '../controllers/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      ////////////// app bar
      appBar: AppBar(
        title: const Text('Flutter Todo app '),
        centerTitle: true,
      ),

      //////////////// todo list show hear use stream builder
      /// todo update, add & delete screen refresh automatic
      body: StreamBuilder(
        stream: controller.collectionReference.snapshots(),
        builder: (context, snapshot) {
          ////////// check connection is waiting
          //////// show loading sign
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );

            /////////// data lode error
            ///////// show message
          } else if (snapshot.hasError) {
            return const Center(
              child: AppText(text: "Something went wrong"),
            );
            ///////////// data lode but todo is empty
            /////////// show no todo message
          } else if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
            return const Center(
              child: AppText(text: "No Todo"),
            );

            ///////////// data lode and has todo
            /// show todo list
          } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            return ListView(
              children: snapshot.data!.docs
                  .map((e) => HomeScreenCart(
                        documentSnapshot: e,
                        homeScreenController: controller,
                      ))
                  .toList(),
            );
          }

          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bottomSheetDialog(); //////////// add todo message
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
