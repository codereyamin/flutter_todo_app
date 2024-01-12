import 'package:flutter/material.dart';
import 'package:flutter_todo_app/app/modules/homeScreen/widgets/bottom_sheet.dart';
import 'package:flutter_todo_app/widgets/app_text.dart';

import 'package:get/get.dart';

import '../controllers/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text('Flutter Todo app '),
        centerTitle: true,
      ),
      body: Card(
        elevation: 5,
        child: ListTile(
          title: AppText(
            text: "DemoData",
          ),
          subtitle: AppText(
            text: "DemoData",
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit), ///////// edit icon
              ),
              IconButton(
                onPressed: () async {},
                icon: const Icon(
                  Icons.delete,
                  color: Colors.redAccent, /////////// remove or delete icon
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bottomSheetDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
