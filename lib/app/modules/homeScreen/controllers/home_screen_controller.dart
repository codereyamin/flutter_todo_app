import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  ////////// form key use text field validation
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /////////// text controller
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  ////////// use doc id
  RxString docId = RxString("");
  /////////// fire base storage reference
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('todo');

//////////////// todo add function
  addTodo() async {
    try {
      await collectionReference.add({
        "name": nameController.text.trim(),
        "mobileNumber": numberController.text.trim()
      });
    } on SocketException catch (e) {
      Get.snackbar("Error", "$e"); ////////// error handling
    } catch (e) {
      Get.snackbar("Error", "This Todo not add");
    }

    Get.back();
  }

//////////////// todo update function
  updateTodo() async {
    try {
      collectionReference.doc(docId.value).update({
        "name": nameController.text.trim(),
        "mobileNumber": numberController.text.trim()
      });
    } on SocketException catch (e) {
      Get.snackbar("Error", "$e"); ///////// error handling
    } catch (e) {
      Get.snackbar("Error", "This Collection Not Update");
    }

    Get.back();
  }

////////////// todo delete function
  deleteTodo(String id) async {
    try {
      await collectionReference.doc(id).delete();
    } on SocketException catch (e) {
      Get.snackbar("Error", "$e"); ///////// error handling
    } catch (e) {
      Get.snackbar("Error", "This Collection Not Delete");
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    numberController.dispose(); ////////// text controller not use than dispose
    super.onClose();
  }
}
