import 'dart:developer';
import 'dart:io';
import 'package:direct_whatsapp/helper/shared_preferences.dart';
import 'package:direct_whatsapp/modules/controller/controller.dart';
import 'package:direct_whatsapp/utils/app_color.dart';
import 'package:direct_whatsapp/utils/appsnackbar.dart';
import 'package:direct_whatsapp/utils/string_utils.dart';
import 'package:direct_whatsapp/widgets/button_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Sms extends StatefulWidget {
  Sms({Key? key}) : super(key: key);

  @override
  State<Sms> createState() => _SmsState();
}

class _SmsState extends State<Sms> {
  Controller controller = Get.find();

  @override
  @override
  Widget build(BuildContext context) {
    return button(
        onTap: () async {
          if (controller.numberController.text.isNotEmpty) {
            if (controller.data.isNotEmpty) {
              controller.numberList.addAll([controller.numberController.text]);
              await SharedPrefs.setNumberList(controller.numberList);
              print("object${controller.numberList}");
              controller.countryList.addAll([controller.data.value]);
              await SharedPrefs.setCountryNumberList(controller.countryList);
              print("CountryObject${controller.countryList}");
              controller.nameCountryList.addAll([controller.countryName.value]);
              await SharedPrefs.setCountryNameList(controller.nameCountryList);
              print("CountryObjectName${controller.nameCountryList}");
              if (Platform.isAndroid) {
                final uri =
                    'sms:+${controller.data.value}${controller.numberController.text}?body=${controller.textController.text}%20';
                log("Sms :- $uri");
                await launch(uri);
              } else if (Platform.isIOS) {
                final uri =
                    'sms:${controller.numberController.text}&body=${controller.textController.text}%20';
                await launch(uri);
              }
            } else {
              AppSnackBar.showErrorSnackBar(
                Icon: Icon(Icons.message, color: AppColors.darkBlue, shadows: [
                  BoxShadow(
                    color: AppColor.appColors.withOpacity(0.8),
                    spreadRadius: 10,
                    blurRadius: 7,
                    offset: const Offset(2, 1), // changes position of shadow
                  ),
                ],),
                message: StringsUtils.pleaseCountryCode,
                title: StringsUtils.openMessages,
                snackPosition: SnackPosition.BOTTOM,
              );
            }
          } else {
            AppSnackBar.showErrorSnackBar(
              Icon: Icon(Icons.message, color: AppColors.darkBlue),
              message: StringsUtils.pleasePhoneNumber,
              title: StringsUtils.openMessages,
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        },
        text: StringsUtils.Messages,
        iconData: Icons.message,
        boxColor: AppColor.whiteColor,
        textColor: AppColors.black,
        iconColor: AppColors.darkBlue);
  }
}
