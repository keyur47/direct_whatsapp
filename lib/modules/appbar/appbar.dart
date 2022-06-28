import 'dart:math';

import 'package:direct_whatsapp/modules/appbar/app.dart';
import 'package:direct_whatsapp/modules/appbar/popupmenubutton/about/about_app.dart';
import 'package:direct_whatsapp/modules/appbar/popupmenubutton/feedback/feedback.dart';
import 'package:direct_whatsapp/modules/appbar/popupmenubutton/history/bottom_navigationbar.dart';
import 'package:direct_whatsapp/modules/appbar/popupmenubutton/rate/rate.dart';
import 'package:direct_whatsapp/modules/appbar/popupmenubutton/share/shareapp.dart';
import 'package:direct_whatsapp/modules/instagram/instagram,dart.dart';
import 'package:direct_whatsapp/modules/sms/sms.dart';
import 'package:direct_whatsapp/modules/telegram/telegram_screen.dart';
import 'package:direct_whatsapp/modules/whatsapp/whatsapp.dart';
import 'package:direct_whatsapp/utils/app_color.dart';
import 'package:direct_whatsapp/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neon/neon.dart';
import 'package:sizer/sizer.dart';

class customAppbar extends StatelessWidget {
  customAppbar({
    required this.text,
    required this.icon,
    required this.iconColor,
    required this.iconColors,
    required this.gradient,
    required this.left,
    required this.right,
    required this.bottom,
    required this.top,
    required this.size
  });

  String text;
  IconData icon;
  Color iconColor;
  Color iconColors;
  Gradient gradient;
  double top;
  double bottom;
  double right;
  double left;
  double size;


  List data = [
    "${StringsUtils.whatsDirects}",
    "${StringsUtils.whatsDirects}",
    "${StringsUtils.instagramDirects}",
    "${StringsUtils.telegramDirects}",
    "${StringsUtils.smsDirects}",
  ];

  BordController controller = Get.put(BordController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 4.w, top: 2.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: gradient),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: top, bottom: bottom, right: right, left: left),
                    child: Icon(
                      icon,
                      size: size,
                      color: iconColor,
                      // shadows: [
                      //   BoxShadow(
                      //     color: iconColors.withOpacity(0.8),
                      //     spreadRadius: 10,
                      //     blurRadius: 7,
                      //     offset: const Offset(
                      //         2, 1), // changes position of shadow
                      //   ),
                      // ]
                    ),
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                PopupMenuButton(
                  child: Neon(
                    text: '${data[controller.pageIndex.value]}',
                    color:  Colors.primaries[Random().nextInt(Colors.primaries.length)],
                    fontSize: 18,
                    font: NeonFont.Automania,
                    flickeringText: true,
                    flickeringLetters: null,
                    glowingDuration: Duration(seconds: 1),
                  ),

                  // Padding(
                  //   padding:  EdgeInsets.only(),
                  //   child: Obx(()=> Text("${data[controller.pageIndex.value]}",style: TextStyle(
                  //       fontSize: 26,
                  //       fontFamily: "Customtext",
                  //       color: AppColors.darkBlue,
                  //       fontWeight: FontWeight.w700),)),
                  // ),
                  onSelected: (int value) {
                    controller.popupMenuItemIndex.value = value;
                    if (controller.popupMenuItemIndex.value == 1) {
                      Get.to(WhatsApp());
                    } else if (controller.popupMenuItemIndex.value == 2) {
                      Get.to(Instagram());
                    } else if (controller.popupMenuItemIndex.value == 3) {
                      Get.to(Telegram());
                    } else if (controller.popupMenuItemIndex.value == 4) {
                      Get.to(SmsNumber());
                    } else {}
                    // controller.value.value = "${controller.popupMenuItemIndex.value}";
                    controller.pageIndex.value =
                        controller.popupMenuItemIndex.value;
                    print("Value:- $value");
                    print("Value12:- ${ controller.popupMenuItemIndex.value}");
                    print("Value14:- ${ controller.value.value}");
                    print("Value19:- ${ controller.pageIndex.value}");
                  },
                  // onSelected: (int value) {
                  //   controller.popupMenuItemIndex.value = value;
                  //   if (controller.popupMenuItemIndex.value  == 1) {
                  //     Get.offAllNamed(TabBarApp.routeName);
                  //   } else if (controller.popupMenuItemIndex.value  == 2) {
                  //     Share();
                  //   } else if (controller.popupMenuItemIndex.value  == 3) {
                  //     RateBox(context);
                  //   } else if (controller.popupMenuItemIndex.value  == 4) {
                  //     FeedbackBox(context);
                  //   } else {
                  //   }
                  //   // controller.value.value = "${controller.popupMenuItemIndex.value}";
                  //   controller.pageIndex.value = controller.popupMenuItemIndex.value;
                  //   print("Value:- $value");
                  //   print("Value12:- ${ controller.popupMenuItemIndex.value}");
                  //   print("Value14:- ${ controller.value.value}");
                  //   print("Value19:- ${ controller.pageIndex.value}");
                  // },
                  itemBuilder: (context) =>
                  [
                    PopupMenuItem(
                      child: Text(StringsUtils.whatsDirects),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Text(StringsUtils.instagramDirects),
                      value: 2,
                    ),
                    PopupMenuItem(
                      child: Text(StringsUtils.telegramDirects),
                      value: 3,
                    ),
                    PopupMenuItem(
                      child: Text(StringsUtils.smsDirects),
                      value: 4,
                    ),
                  ],
                  // itemBuilder: (context) => [
                  //   PopupMenuItem(
                  //     child: Text(StringsUtils.history),
                  //     value: 1,
                  //   ),
                  //   PopupMenuItem(
                  //     child: Text(StringsUtils.shareApp),
                  //     value: 2,
                  //   ),
                  //   PopupMenuItem(
                  //     child: Text(StringsUtils.rateApp),
                  //     value: 3,
                  //   ),
                  //   PopupMenuItem(
                  //     child: Text(StringsUtils.feedback),
                  //     value: 4,
                  //   ),
                  //   PopupMenuItem(
                  //     child: Text(StringsUtils.termsAndPrivacy),
                  //     value: 5,
                  //   ),
                  //   PopupMenuItem(
                  //     child: Text(StringsUtils.aboutApp),
                  //     value: 6,
                  //   ),
                  // ],
                ),
              ],
            ),

            PopupMenuButton(
              onSelected: (int value) {
                if (value == 1) {
                  Get.offAllNamed(TabBarApp.routeName);
                } else if (value == 2) {
                  Share();
                } else if (value == 3) {
                  RateBox(context);
                } else if (value == 4) {
                  FeedbackBox(context);
                } else if (value == 5) {} else {
                  Get.to(AboutApp());
                }
                controller.pageIndex.value =
                    controller.popupMenuItemIndex.value;
                print("Value:- $value");
                print("Value12:- ${ controller.popupMenuItemIndex.value}");
                print("Value14:- ${ controller.value.value}");
                print("Value19:- ${ controller.pageIndex.value}");
              },

              itemBuilder: (context) =>
              [
                PopupMenuItem(
                  child: Text(StringsUtils.history),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text(StringsUtils.shareApp),
                  value: 2,
                ),
                PopupMenuItem(
                  child: Text(StringsUtils.rateApp),
                  value: 3,
                ),
                PopupMenuItem(
                  child: Text(StringsUtils.feedback),
                  value: 4,
                ),
                PopupMenuItem(
                  child: Text(StringsUtils.termsAndPrivacy),
                  value: 5,
                ),
                PopupMenuItem(
                  child: Text(StringsUtils.aboutApp),
                  value: 6,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}
