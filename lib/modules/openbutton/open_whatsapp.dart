import 'package:direct_whatsapp/helper/shared_preferences.dart';
import 'package:direct_whatsapp/modules/controller/controller.dart';
import 'package:direct_whatsapp/utils/app_color.dart';
import 'package:direct_whatsapp/utils/appsnackbar.dart';
import 'package:direct_whatsapp/utils/string_utils.dart';
import 'package:direct_whatsapp/widgets/button_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenWhatsApp extends StatelessWidget {
   OpenWhatsApp({Key? key}) : super(key: key);

  Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return button(
        onTap: () async {
          if (controller
              .myController.text.isNotEmpty) {
            if (controller.data.isNotEmpty) {
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
              "https://wa.me/+${controller.data.value}${controller.myController.text}?text=${controller.textController.text}";
              await launch(controller.url.value);
              print("------${controller.url.value}");
            } else {
              AppSnackBar.showErrorSnackBar(
                Icon: Icon(Icons.whatsapp,color: Colors.green,shadows: [
                  BoxShadow(
                    color: AppColor.appColors.withOpacity(0.8),
                    spreadRadius: 10,
                    blurRadius: 7,
                    offset: const Offset(
                        2, 1), // changes position of shadow
                  ),
                ]),
                message: StringsUtils.pleaseCountryCode,
                title: StringsUtils.openWhatsApp,
                snackPosition: SnackPosition.BOTTOM,
              );
            }
          } else {
            AppSnackBar.showErrorSnackBar(
              Icon: Icon(Icons.whatsapp,color: Colors.green),
              message: StringsUtils.pleasePhoneNumber,
              title: StringsUtils.openWhatsApp,
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        },
        text: StringsUtils.openWhatsApp,
        iconData: Icons.whatsapp,
        textColor: AppColor.whiteColor,
        boxColor: AppColors.darkBlue,
        iconColor: AppColors.green);
  }
}
