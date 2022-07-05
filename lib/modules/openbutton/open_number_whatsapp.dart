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

class OpenWhatsAppNumber extends StatelessWidget {
  Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return button(
      onTap: () async {
        if (controller.contactsNumberController.text.isNotEmpty) {
          if (controller.countryNumber.isNotEmpty) {
            controller.url.value =
                "https://wa.me/+${controller.countryNumber.value}${controller.contactsNumberController.text}?text=${controller.contactsNumberTextController.text}";
            await launch(controller.url.value);
            print("------${controller.url.value}");
            ///
            controller.contactsNumberList.addAll([controller.contactsNumberController.text]);
            await SharedPrefs.setNumberList(controller.contactsNumberList);
            print("contactsNumberList:-${controller.contactsNumberList}");
            ///
            controller.countryNumberList.addAll([controller.countryNumber.value]);
            await SharedPrefs.setCountryNumberList(controller.countryNumberList);
            print("countryNumber:-${controller.countryNumberList}");
            ///
            controller.countryNameList.addAll([controller.countryName.value]);
            await SharedPrefs.setCountryNameList(controller.countryNameList);
            print("countryNameList:-${controller.countryNameList}");
            ///
            controller.dateTime.addAll([dateTime()]);
            await SharedPrefs.setDateTimeList(controller.dateTime);
            print("dateTime:-${controller.dateTime}");
            ///
            controller.day.addAll([day()]);
            await SharedPrefs.setDayList(controller.day);
            print("day:-${controller.day}");
            ///
            controller.type.addAll(["WhatsApp"]);
            await SharedPrefs.setTypeList(controller.type);
            print("Type:-${controller.type}");
            ///
            controller.chatContactsNumberList.addAll([controller.contactsNumberTextController.text]);
            await SharedPrefs.setChatList(controller.chatContactsNumberList);
            print("chat:-${controller.chatContactsNumberList}");
            ///
          } else {
            AppSnackBar.showErrorSnackBar(
              Icon: Icon(Icons.whatsapp, color: Colors.green, shadows: [
                BoxShadow(
                  color: AppColor.appColors.withOpacity(0.8),
                  spreadRadius: 10,
                  blurRadius: 7,
                  offset: const Offset(2, 1), // changes position of shadow
                ),
              ]),
              message: StringsUtils.pleaseCountryCode,
              title: StringsUtils.openWhatsApp,
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        } else {
          AppSnackBar.showErrorSnackBar(
            Icon: Icon(Icons.whatsapp, color: Colors.green),
            message: StringsUtils.pleasePhoneNumber,
            title: StringsUtils.openWhatsApp,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      },
      text: StringsUtils.openWhatsApp,
      // iconData: Icons.whatsapp,
      //image: "assets/image/whatsapp.png",
      iconData: Icons.whatsapp,
      scale: 3,
      top: 1.1.h,
      left: 1.2.h,
      right: 0.7.h,
      bottom: 1.1.h,
      ImageColor: AppColors.green,
      textColor: AppColor.blackColor,
      boxColor: AppColors.white,
      iconColor: Color(0xFF28D146),
      // iconColor: Color(0xFF28D146),
      sizeIcon: 7.w,
    );
  }
}
