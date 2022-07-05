import 'package:direct_whatsapp/helper/shared_preferences.dart';
import 'package:direct_whatsapp/modules/controller/all_screen_controller.dart';
import 'package:direct_whatsapp/utils/app_color.dart';
import 'package:direct_whatsapp/utils/appsnackbar.dart';
import 'package:direct_whatsapp/utils/string_utils.dart';
import 'package:direct_whatsapp/widgets/button_box.dart';
import 'package:direct_whatsapp/widgets/datetime.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenTelegramNumber extends StatelessWidget {
  OpenTelegramNumber({Key? key}) : super(key: key);
  Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return button(
      onTap: () async {
        if (controller.contactsNumberController.text.isNotEmpty) {
          if (controller.countryNumber.value.isNotEmpty) {
            controller.contactsNumberList.addAll([controller.contactsNumberController.text]);
            await SharedPrefs.setNumberList(controller.contactsNumberList);
            print("object${controller.contactsNumberList}");
            controller.countryNumberList.addAll([controller.countryNumber.value]);
            await SharedPrefs.setCountryNumberList(controller.countryNumberList);
            print("CountryObject${controller.countryNumberList}");
            controller.countryNameList.addAll([controller.countryName.value]);
            await SharedPrefs.setCountryNameList(controller.countryNameList);
            print("CountryObjectName${controller.countryNameList}");
            controller.dateTime.addAll([dateTime()]);
            await SharedPrefs.setDateTimeList(controller.dateTime);
            print("dateTime${controller.dateTime}");
            controller.url.value =
                "https://telegram.me/+${controller.countryNumber.value}${controller.contactsNumberController.text}";
            await launch(controller.url.value);
            print("------${controller.url.value}");
          } else {
            AppSnackBar.showErrorSnackBar(
              Icon: Icon(Icons.telegram, color: Colors.blue),
              message: StringsUtils.pleaseCountryCode,
              title: StringsUtils.userNameTelegram,
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        } else {
          AppSnackBar.showErrorSnackBar(
            Icon: Icon(Icons.telegram, color: Colors.blue),
            message: StringsUtils.pleasePhoneNumber,
            title: StringsUtils.userNameTelegram,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      },
      text: StringsUtils.telegram,
      iconData: Icons.telegram_outlined,
      image: "assets/image/telegram.png",
      scale: 3,
      top: 1.5.h,
      left: 1.5.h,
      right: 1.h,
      bottom: 1.5.h,
      boxColor: AppColors.white,
      textColor: AppColors.black,
      sizeIcon: 7.w,
      iconColor:  Color(0xFF28D146),
      // iconColor: Colors.blue,
    );
  }
}
