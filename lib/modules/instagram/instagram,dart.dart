import 'package:direct_whatsapp/modules/appbar/appbar.dart';
import 'package:direct_whatsapp/modules/controller/controller.dart';
import 'package:direct_whatsapp/modules/openbutton/instagram.dart';
import 'package:direct_whatsapp/widgets/custom_icons_icons.dart';
import 'package:direct_whatsapp/widgets/custom_textfield.dart';
import 'package:direct_whatsapp/utils/app_color.dart';
import 'package:direct_whatsapp/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Instagram extends StatefulWidget {
  @override
  _InstagramState createState() => _InstagramState();
}

class _InstagramState extends State<Instagram> {
  Controller controller = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      resizeToAvoidBottomInset: false,
      body:Column(
        children: [
          customAppbar(text: StringsUtils.instagramDirects,icon: CustomIcons.instagram,iconColor: Colors.white,iconColors: Colors.white,gradient: LinearGradient(
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
            top: 0.4.h,
            bottom: 0.5.h,
            right: 1.w,
            left: 1.1.w,
            size: 10.w,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 4.w,right: 4.w,top: 2.w),
            child: Column(
              children: [
                usernameTextField(
                    controller: controller.usernameController,
                    showCursor: false,
                    hintText: StringsUtils.username,
                    textInputType: TextInputType.none,
                    onTap: () async {
                      controller.usernameController.clear();
                    }),
              ],
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UserNameInstagram()
            ],
          ),
        ],
      ),
    );
  }
}
