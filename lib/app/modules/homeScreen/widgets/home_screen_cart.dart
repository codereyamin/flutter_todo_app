import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/app/modules/homeScreen/controllers/home_screen_controller.dart';
import 'package:flutter_todo_app/app/modules/homeScreen/widgets/bottom_sheet.dart';
import 'package:flutter_todo_app/widgets/app_text.dart';

class HomeScreenCart extends StatelessWidget {
  const HomeScreenCart({
    super.key,
    required this.documentSnapshot,
    required this.homeScreenController,
  });

  final QueryDocumentSnapshot documentSnapshot;
  final HomeScreenController homeScreenController;

  @override
  Widget build(BuildContext context) {
    var data = documentSnapshot.data()
        as Map<String, dynamic>; /////////// convert data to map
    return Card(
      elevation: 5,
      child: ListTile(
        title: AppText(
          text: data["name"] ?? "",
        ),
        subtitle: AppText(
          text: data["mobileNumber"] ?? "",
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                bottomSheetDialog(
                    documentSnapshot: documentSnapshot, isAdd: false);
              },
              icon: const Icon(Icons.edit), ///////// edit icon
            ),
            IconButton(
              onPressed: () {
                homeScreenController.deleteTodo(documentSnapshot.id);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.redAccent, /////////// remove or delete icon
              ),
            ),
          ],
        ),
      ),
    );
  }
}
