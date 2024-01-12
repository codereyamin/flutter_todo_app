import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/////////// bottom sheet create function
bottomSheetDialog({bool isAdd = true}) async {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
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
        key: formKey, //////// key assign
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
                    controller: nameController,
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
                    controller: numberController,
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
                    if (formKey.currentState!.validate()) {}
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
