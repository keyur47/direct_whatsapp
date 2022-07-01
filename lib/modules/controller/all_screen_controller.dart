import 'package:direct_whatsapp/utils/string_utils.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  TextEditingController contactsNumberController = TextEditingController();
  TextEditingController callAndMessagesNumberController = TextEditingController();
  TextEditingController contactsNumberTextController = TextEditingController();
  TextEditingController messagesNumberTextController = TextEditingController();
  TextEditingController telegramUsernameController = TextEditingController();
  TextEditingController instagramUsernameController = TextEditingController();
  TextEditingController emailFeedBackController = TextEditingController();
  TextEditingController FeedBackController = TextEditingController();
  TextEditingController callNumberController = TextEditingController();
   TextEditingController callCountryNumberController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode textFocusNode = FocusNode();
  List<String> contactsNumberList = [];
  List<String> toSetContactsNumberList = [];
  List<String> countryNumberList = [];
  List<String> countryNameList = [];
  List<String> usernameList = [];
  List<String> dateTime = [];
  List<String> day = [];
  List<String> type = [];
  List<String> chatContactsNumberList = [];
  RxString url = ''.obs;
  RxString countryNumber = ''.obs;
  RxString countryName = ''.obs;
  RxString errorMessage = "".obs;



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

