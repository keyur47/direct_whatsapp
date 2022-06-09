import 'package:direct_whatsapp/utils/appsnackbar.dart';
import 'package:direct_whatsapp/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {

  TextEditingController myController = TextEditingController();
  TextEditingController textController = TextEditingController();
  TextEditingController emailFeedBackController = TextEditingController();
  TextEditingController FeedBackController = TextEditingController();
  FocusNode focusNode = FocusNode();
  FocusNode focusNodes = FocusNode();
  RxBool isOpenKeyboard  = false.obs;
  RxString url = ''.obs;
  RxString data = ''.obs;
  RxString countryName = ''.obs;
  String allData = "";
  List<String> numberList = [];
  List<String> countryList = [];
  List<String> nameCountryList = [];
  List<String> nameTelegramList = [];
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmFocusNode = FocusNode();


  void onInit() {
    emailFocusNode.addListener(() {
      if (!emailFocusNode.hasFocus) {
        AppSnackBar
            .showErrorSnackBar(
          message:
          "Please Enter Email & Feedback",
          title: 'Error',
          snackPosition:
          SnackPosition.TOP,
        );
      }else if (!(RegExp(StringsUtils.emailRegExp)
          .hasMatch(emailFeedBackController.text.trim()))) {
        AppSnackBar
            .showErrorSnackBar(
          message:
          "Please Enter a & b",
          title: 'Error',
          snackPosition:
          SnackPosition.TOP,
        );
      }
    });
    super.onInit();
  }



  // @override
  //   void onInit() {
  //     focusNode.addListener(() {
  //     //controller.isOpenKeyboard.value = controller.focusNode.hasFocus;// setState(() {});
  //     focusNode.hasFocus?isOpenKeyboard.value = true:isOpenKeyboard.value = false;
  //     });
  //    super.onInit();
  //  }

  // @override
  // void dispose() {
  //   focusNode.dispose();
  //   super.dispose();
  // }

}
