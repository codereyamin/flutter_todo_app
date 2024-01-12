import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_todo_app/app/modules/homeScreen/controllers/home_screen_controller.dart';
import 'package:get/get.dart';

/////////// bottom sheet create function
bottomSheetDialog({
  bool isAdd = true,
  QueryDocumentSnapshot? documentSnapshot,
}) async {
  //////////////// home controller find
  HomeScreenController homeScreenController = Get.find<HomeScreenController>();
//////////////// check document is not null
  if (documentSnapshot != null) {
    var data = documentSnapshot.data()
        as Map<String, dynamic>; ///////// data convert map
    homeScreenController.docId.value = documentSnapshot.id.toString();
    homeScreenController.nameController.text =
        data["name"].toString(); //////////// assign data text controller
    homeScreenController.numberController.text =
        data["mobileNumber"].toString();
  }
  //////// bottom sheet call
  await Get.bottomSheet(
    Container(
      width: Get.width,
      // height: Get.height / 10 * 4,
      ////////// some decoration
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Form(
        key: homeScreenController.formKey, //////// key assign
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ////////// name field
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: homeScreenController.nameController,
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Name field is required";
                      }

                      return null;
                    },
                    //////////// field decoration
                    decoration: const InputDecoration(
                      labelText: "User Name",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                ),
                ///////  mobile number field
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: homeScreenController.numberController,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Mobile number field is required";
                      }
                      if (value.length < 10) {
                        return "Mobile number is not valid";
                      }
                      return null;
                    },
                    //////////// field decoration
                    decoration: const InputDecoration(
                      labelText: "Mobile Number",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    /////////// first check validation
                    if (homeScreenController.formKey.currentState!.validate()) {
                      //////////// call data is update or add function
                      if (isAdd) {
                        homeScreenController.addTodo();
                      } else {
                        homeScreenController.updateTodo();
                      }
                    }
                  },

                  ///////// button some style
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(
                        color: Colors.blueGrey,
                        width: 5,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 60),
                    child: Text(
                      isAdd
                          ? "Add"
                          : "Update", /////// show message note update or add
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    ),
    isScrollControlled: true,
  );
}
