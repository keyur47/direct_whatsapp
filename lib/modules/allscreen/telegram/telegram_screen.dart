import 'package:direct_whatsapp/modules/appbar/appbar.dart';
import 'package:direct_whatsapp/modules/controller/all_screen_controller.dart';
import 'package:direct_whatsapp/modules/openbutton/open_username_telegram.dart';
import 'package:direct_whatsapp/utils/app_color.dart';
import 'package:direct_whatsapp/utils/string_utils.dart';
import 'package:direct_whatsapp/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Telegram extends StatefulWidget {
  @override
  _TelegramState createState() => _TelegramState();
}

class _TelegramState extends State<Telegram> {
  Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customAppbar(
            text: StringsUtils.telegramDirects,
            icon: Icons.telegram,
            iconColor: Colors.lightBlue,
            iconColors: Colors.lightBlue,
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [Colors.white, Colors.white]),
            top: 0.4.h,
            bottom: 0.4.h,
            right: 0.9.w,
            left: 0.9.w,
            size: 10.w,
          ),
          Padding(
            padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 2.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                usernameTextField(
                    controller: controller.telegramUsernameController,
                    showCursor: false,
                    hintText: StringsUtils.username,
                    textInputType: TextInputType.none,
                    onTap: () async {
                      controller.telegramUsernameController.clear();
                    }),
              ],
            ),
          ),
          SizedBox(
            height: 2.5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OpenUserNameTelegram(),
            ],
          ),
        ],
      ),
    );
  }
}
