import 'package:direct_whatsapp/helper/shared_preferences.dart';
import 'package:direct_whatsapp/modules/controller/controller.dart';
import 'package:direct_whatsapp/utils/app_color.dart';
import 'package:direct_whatsapp/utils/appsnackbar.dart';
import 'package:direct_whatsapp/utils/string_utils.dart';
import 'package:direct_whatsapp/widgets/button_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class UserNameInstagram extends StatefulWidget {
  UserNameInstagram({Key? key}) : super(key: key);

  @override
  State<UserNameInstagram> createState() => _UserNameInstagramState();
}

class _UserNameInstagramState extends State<UserNameInstagram> {
  Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return button(
        onTap: () async {
          if (controller
              .textController.text.isNotEmpty) {
            controller.nameTelegramList.addAll(
                [controller.textController.text]);
            await SharedPrefs.setUserNameList(
                controller.nameTelegramList);
            print("object${controller.numberList}");
            controller.url.value = "instagram://user?username=${controller.textController.text}";
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
        text: StringsUtils.userNameInstagram,
        iconData: Icons.people_alt_sharp,
        boxColor: AppColor.whiteColor,
        textColor: AppColors.black,
        iconColor: Colors.orange);
  }
}


