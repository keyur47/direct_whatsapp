import 'package:direct_whatsapp/utils/string_utils.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  TextEditingController numberController = TextEditingController();
  TextEditingController smsNumberController = TextEditingController();
  TextEditingController textController = TextEditingController();
  TextEditingController smsTextController = TextEditingController();
  TextEditingController telegramUsernameController = TextEditingController();
  TextEditingController instagramUsernameController = TextEditingController();
  TextEditingController emailFeedBackController = TextEditingController();
  TextEditingController FeedBackController = TextEditingController();
  PageController pageController = PageController();
  FocusNode emailFocusNode = FocusNode();
  final kGreyBackground = Colors.transparent;
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmFocusNode = FocusNode();
  List<String> numberList = [];
  List<String> getNumberList = [];
  List<String> countryList = [];
  List<String> nameCountryList = [];
  List<String> nameTelegramList = [];
  List<String> dateTime = [];
  List<String> type = [];
  List<String>? typeTo = [];
  List<String> day = [];
  RxBool isOpenKeyboard  = false.obs;
  RxBool isEnabled  = false.obs;
  RxBool Icon = false.obs;
  RxString url = ''.obs;
  RxString data = ''.obs;
  RxString countryName = ''.obs;
  RxString errorMessage = "".obs;
  RxString uniqueNumbers = "".obs;

  List colors = [
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.pink,
    Colors.deepOrangeAccent,
    Colors.green,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.purple,
    Colors.deepPurpleAccent,
    Colors.indigo,
    Colors.orangeAccent,
    Colors.lightBlueAccent,
  ];

  void validateEmail(String val) {
    if(val.isEmpty){
        errorMessage.value = StringsUtils.pleaseEmails;
    }else if(!EmailValidator.validate(val, true)){
        errorMessage.value = "Invalid Email Address";
    }else{
        errorMessage.value = "";
    }
  }



}


// void onInit() {
//   emailFocusNode.addListener(() {
//     if (!emailFocusNode.hasFocus) {
//       AppSnackBar
//           .showErrorSnackBar(
//         message:
//         "Please Enter Email & Feedback",
//         title: 'Error',
//         snackPosition:
//         SnackPosition.TOP,
//       );
//     }else if (!(RegExp(StringsUtils.emailRegExp)
//         .hasMatch(emailFeedBackController.text.trim()))) {
//       AppSnackBar
//           .showErrorSnackBar(
//         message:
//         "Please Enter a & b",
//         title: 'Error',
//         snackPosition:
//         SnackPosition.TOP,
//       );
//     }
//   });
//   super.onInit();
// }



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
