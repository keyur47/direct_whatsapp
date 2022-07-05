import 'package:direct_whatsapp/helper/shared_preferences.dart';
import 'package:direct_whatsapp/modules/controller/all_screen_controller.dart';
import 'package:direct_whatsapp/utils/app_color.dart';
import 'package:direct_whatsapp/utils/appsnackbar.dart';
import 'package:direct_whatsapp/utils/string_utils.dart';
import 'package:direct_whatsapp/widgets/button_box.dart';
import 'package:direct_whatsapp/widgets/call.dart';
import 'package:direct_whatsapp/widgets/datetime.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class OpenCalls extends StatefulWidget {
  OpenCalls({Key? key}) : super(key: key);

  @override
  State<OpenCalls> createState() => _OpenCallsState();
}

class _OpenCallsState extends State<OpenCalls> {
  Controller controller = Get.find();

  @override
  @override
  Widget build(BuildContext context) {
    return button(
        onTap: () async {
          if (controller.callAndMessagesNumberController.text.isNotEmpty) {
            if (controller.countryNumber.isNotEmpty) {
              controller.contactsNumberList.addAll([controller.callAndMessagesNumberController.text]);
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
              makePhoneCall(
                  contact:
                  "+${controller.countryNumber.value}${controller.callAndMessagesNumberController.text}",
                  direct: true);
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
        text: StringsUtils.call,
        iconData: Icons.call_outlined,
        scale: 3,
        top: 1.1.h,
        left: 1.5.h,
        right: 1.h,
        bottom: 1.1.h,
        boxColor: AppColor.whiteColor,
        textColor: AppColors.black,
        iconColor:Color(0xFF28D146),
        sizeIcon: 7.w
    );
  }
}
