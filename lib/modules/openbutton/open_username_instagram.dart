import 'package:direct_whatsapp/helper/shared_preferences.dart';
import 'package:direct_whatsapp/modules/controller/all_screen_controller.dart';
import 'package:direct_whatsapp/utils/app_color.dart';
import 'package:direct_whatsapp/utils/appsnackbar.dart';
import 'package:direct_whatsapp/utils/string_utils.dart';
import 'package:direct_whatsapp/widgets/button_box.dart';
import 'package:direct_whatsapp/widgets/custom_icons_icons.dart';
import 'package:direct_whatsapp/widgets/datetime.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenUserNameInstagram extends StatelessWidget {
  OpenUserNameInstagram({Key? key}) : super(key: key);

  Controller controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return button(
        onTap: () async {
          if (controller
              .instagramUsernameController.text.isNotEmpty) {
            controller.usernameList.addAll([controller.instagramUsernameController.text]);
            await SharedPrefs.setUserNameList(controller.usernameList);
            print("object${controller.contactsNumberList}");
            controller.dateTime.addAll([dateTime()]);
            await SharedPrefs.setDateTimeList(controller.dateTime);
            print("dateTimeinstagram${controller.dateTime}");
            controller.url.value = "instagram://user?username=${controller.instagramUsernameController.text}";
            // controller.url.value = "https://www.instagram.com/${controller.textController.text}/";
            await launch(controller.url.value);
            print("------${controller.url.value}");
          } else {
            AppSnackBar.showErrorSnackBar(
              Icon: Icon(Icons.people_alt_rounded,color: Colors.blue),
              message: StringsUtils.pleaseUsername,
              title: StringsUtils.userNameTelegram,
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        },
        text: StringsUtils.instagram,
        iconData: CustomIcons.instagram,
        image: "assets/image/whatsapp.png",
        scale: 3,
        top: 1.1.h,
        left: 1.5.h,
        right: 1.h,
        bottom: 1.1.h,
        boxColor: AppColor.whiteColor,
        textColor: AppColors.black,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,colors: [
              Color(0xFF405DE6),
              Color(0xFF5851DB),
              Color(0xFF833AB4),
              Color(0xFFC13584),
              Color(0xFFE1306C),
              Color(0xFFFD1D1D),
              Color(0xFFF56040),
              Color(0xFFF77737),
              Color(0xFFFCAF45),
              Color(0xFFFFDC80),
            ]),
            borderRadius: BorderRadius.circular(5)
        ),
        iconColor: Colors.white);
  }
}


