import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:direct_whatsapp/modules/allscreen/instagram/instagram_screen.dart';
import 'package:direct_whatsapp/modules/allscreen/messages/sms_screen.dart';
import 'package:direct_whatsapp/modules/allscreen/telegram/telegram_screen.dart';
import 'package:direct_whatsapp/modules/allscreen/whatsapp/whatsapp_screen.dart';
import 'package:direct_whatsapp/modules/appbar/appbar_controller.dart';
import 'package:direct_whatsapp/modules/appbar/popupmenubutton/feedback/feedback.dart';
import 'package:direct_whatsapp/modules/appbar/popupmenubutton/history/bottom_navigationbar.dart';
import 'package:direct_whatsapp/modules/appbar/popupmenubutton/rate/rate.dart';
import 'package:direct_whatsapp/modules/appbar/popupmenubutton/share/shareapp.dart';
import 'package:direct_whatsapp/utils/app_color.dart';
import 'package:direct_whatsapp/utils/string_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class customAppbar extends StatelessWidget {
  customAppbar(
      {required this.text,
      required this.icon,
      required this.iconColor,
      required this.iconColors,
      required this.gradient,
      required this.left,
      required this.right,
      required this.bottom,
      required this.top,
      required this.size});

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

  AppbarController controller = Get.put(AppbarController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          // Image.network(
          //   "https://thumbs.gfycat.com/AccurateScrawnyAnkole-size_restricted.gif",
          //   height: 8.h,
          //   width: 100.w,
          //   fit: BoxFit.cover,
          // ),
          Padding(
            padding: EdgeInsets.only(left: 4.w, top: 2.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 3,
                              offset: Offset(4, 6), // Shadow position
                            ),
                          ],
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
                    // DefaultTextStyle(
                    //   style: const TextStyle(
                    //       fontSize: 18.0,
                    //       fontFamily: 'Customtext',
                    //       color: AppColors.darkBlue),
                    //   child: Obx(
                    //     () => AnimatedTextKit(
                    //       pause: Duration(milliseconds: 100),
                    //       animatedTexts: [
                    //         WavyAnimatedText(
                    //             '${data[controller.pageIndex.value]}'),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Text("${data[controller.pageIndex.value]}",style: TextStyle(fontSize: 18,
                        fontFamily: "Customtext",
                        color:   AppColors.darkBlue,),),
                    PopupMenuButton(
                      elevation: 20,

                      // child: Neon(
                      //   textStyle: TextStyle(),
                      //   text: '${data[controller.pageIndex.value]}',
                      //   color:  Colors.primaries[Random().nextInt(Colors.primaries.length)],
                      //   fontSize: 18,
                      //   font: NeonFont.TextMeOne,
                      //   flickeringText: true,
                      //   flickeringLetters: null,
                      //   glowingDuration: Duration(seconds: 1),
                      // ),

                      child: Icon(Icons.keyboard_arrow_down_sharp),
                      // Text("${data[controller.pageIndex.value]}",style: TextStyle(
                      // fontSize: 18,
                      // fontFamily: "Customtext",
                      // color:   AppColors.darkBlue,
                      // fontWeight: FontWeight.w700))

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
                        print(
                            "Value12:- ${controller.popupMenuItemIndex.value}");
                        print("Value14:- ${controller.value.value}");
                        print("Value19:- ${controller.pageIndex.value}");
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          padding: EdgeInsets.zero,
                          child: Center(
                              child: Text(
                            StringsUtils.whatsApp,
                            style: TextStyle(
                                fontFamily: "Customtext",
                                color: AppColors.darkBlue),
                          )),
                          value: 1,
                        ),
                        PopupMenuItem(
                          padding: EdgeInsets.zero,
                          child: Center(
                              child: Text(StringsUtils.instagram,
                                  style: TextStyle(
                                      fontFamily: "Customtext",
                                      color: AppColors.darkBlue))),
                          value: 2,
                        ),
                        PopupMenuItem(
                          padding: EdgeInsets.zero,
                          child: Center(
                              child: Text(StringsUtils.telegram,
                                  style: TextStyle(
                                      fontFamily: "Customtext",
                                      color: AppColors.darkBlue))),
                          value: 3,
                        ),
                        PopupMenuItem(
                          padding: EdgeInsets.zero,
                          child: Center(
                              child: Text(StringsUtils.sms,
                                  style: TextStyle(
                                      fontFamily: "Customtext",
                                      color: AppColors.darkBlue))),
                          value: 4,
                        ),
                      ],
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
                    } else if (value == 5) {
                    } else {
                      // Get.to(AboutApp());
                    }
                    controller.pageIndex.value =
                        controller.popupMenuItemIndex.value;
                    print("Value:- $value");
                    print("Value12:- ${controller.popupMenuItemIndex.value}");
                    print("Value14:- ${controller.value.value}");
                    print("Value19:- ${controller.pageIndex.value}");
                  },
                  itemBuilder: (context) => [
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
        ],
      ),
    );
  }
}

Widget dataAppbar({required String text}) {
  return Container(
    color: AppColors.darkBlue,
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 6.h,
            bottom: 1.h,
            left: 4.w,
          ),
          child: DefaultTextStyle(
            style: const TextStyle(
                fontSize: 22.0,
                fontFamily: 'Customtext',
                color: AppColor.backgroundColor),
            child: AnimatedTextKit(
              pause: Duration(milliseconds: 100),
              animatedTexts: [
                TypewriterAnimatedText(text),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
