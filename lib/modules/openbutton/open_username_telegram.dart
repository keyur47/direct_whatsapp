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

class OpenUserNameTelegram extends StatelessWidget {
  OpenUserNameTelegram({Key? key}) : super(key: key);
  Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return button(
        onTap: () async {
          if (controller.telegramUsernameController.text.isNotEmpty) {
            controller.nameTelegramList
                .addAll([controller.telegramUsernameController.text]);
            await SharedPrefs.setUserNameList(controller.nameTelegramList);
            print("object${controller.numberList}");
            controller.dateTime.addAll([dateTime()]);
            await SharedPrefs.setDateTimeList(controller.dateTime);
            print("dateTime${controller.dateTime}");
            controller.url.value =
                "https://telegram.me/${controller.telegramUsernameController.text}";
            await launch(controller.url.value);
            print("------${controller.url.value}");
          } else {
            AppSnackBar.showErrorSnackBar(
              Icon: Icon(Icons.people_alt_rounded, color: Colors.blue),
              message: StringsUtils.pleaseUsername,
              title: StringsUtils.userNameTelegram,
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        },
        text: StringsUtils.userNameTelegram,
        iconData: Icons.telegram_outlined,
        image: "assets/image/telegram.png",
        scale: 3,
        top: 1.5.h,
        left: 1.5.h,
        right: 1.5.h,
        bottom: 1.5.h,
        boxColor: AppColor.whiteColor,
        textColor: AppColors.black,
        iconColor: Colors.blue,
        sizeIcon: 7.w);
  }
}