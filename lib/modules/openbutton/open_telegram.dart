import 'package:direct_whatsapp/helper/shared_preferences.dart';
import 'package:direct_whatsapp/modules/controller/controller.dart';
import 'package:direct_whatsapp/utils/app_color.dart';
import 'package:direct_whatsapp/utils/appsnackbar.dart';
import 'package:direct_whatsapp/utils/string_utils.dart';
import 'package:direct_whatsapp/widgets/button_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenTelegram extends StatelessWidget {
   OpenTelegram({Key? key}) : super(key: key);
  Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return button(
        onTap: () async {
          if (controller
              .myController.text.isNotEmpty) {
            if(controller.data.value.isNotEmpty) {
              controller.numberList.addAll(
                  [controller.myController.text]);
              await SharedPrefs.setNumberList(
                  controller.numberList);
              print("object${controller.numberList}");
              controller.countryList
                  .addAll([controller.data.value]);
              await SharedPrefs.setCountryNumberList(
                  controller.countryList);
              print(
                  "CountryObject${controller.countryList}");
              controller.nameCountryList.addAll(
                  [controller.countryName.value]);
              await SharedPrefs.setCountryNameList(
                  controller.nameCountryList);
              print(
                  "CountryObjectName${controller.nameCountryList}");
              controller.url.value =
              "https://telegram.me/+${controller.data.value}${controller
                  .myController.text}";
              await launch(controller.url.value);
              print("------${controller.url.value}");
            }else{
              AppSnackBar.showErrorSnackBar(
                Icon: Icon(Icons.telegram,color: Colors.blue),
                message: StringsUtils.pleaseCountryCode,
                title: StringsUtils.userNameTelegram,
                snackPosition: SnackPosition.BOTTOM,
              );
            }
          } else {
            AppSnackBar.showErrorSnackBar(
              Icon: Icon(Icons.telegram,color: Colors.blue),
              message: StringsUtils.pleasePhoneNumber,
              title: StringsUtils.userNameTelegram,
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        },
        text: StringsUtils.openTelegram,
        iconData: Icons.telegram,
        boxColor: AppColors.white,
        textColor: AppColors.black,
        iconColor: Colors.blue);
  }
}
