import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:direct_whatsapp/modules/allscreen/instagram/instagram_screen.dart';
import 'package:direct_whatsapp/modules/allscreen/messages/messages_screen.dart';
import 'package:direct_whatsapp/modules/allscreen/snapchat/snapchat_screen.dart';
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
      required this.directText,
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
  String directText;

  //
  List data = [
    "${StringsUtils.whatsDirects}",
    "${StringsUtils.whatsDirects}",
    "${StringsUtils.instagramDirects}",
    "${StringsUtils.telegramDirects}",
    "${StringsUtils.smsDirects}",
  ];
  AppbarController controller = Get.put(AppbarController());
  final GlobalKey<PopupMenuButtonState<int>> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 4.w, top: 2.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // _key.currentState?.showButtonMenu();
                      },
                      child: Container(
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
                              top: top,
                              bottom: bottom,
                              right: right,
                              left: left),
                          child: Icon(
                            icon,
                            size: size,
                            color: iconColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      directText,
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Customtext",
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.w700),
                    ),
                    PopupMenuButton<int>(
                      key: _key,
                      elevation: 20,
                      child: Icon(Icons.arrow_drop_down),
                      onSelected: (int value) {
                        controller.popupMenuItemIndex.value = value;
                        if (controller.popupMenuItemIndex.value == 1) {
                          Get.toNamed(WhatsApp.routeName);
                        } else if (controller.popupMenuItemIndex.value == 2) {
                          Get.toNamed(Instagram.routeName);
                        } else if (controller.popupMenuItemIndex.value == 3) {
                          Get.toNamed(Telegram.routeName);
                        } else if (controller.popupMenuItemIndex.value == 4) {
                          Get.toNamed(Messages.routeName);
                        } else if (controller.popupMenuItemIndex.value == 5) {
                          Get.toNamed(Snapchat.routeName);
                        } else {}
                        controller.pageIndex.value =
                            controller.popupMenuItemIndex.value;
                        print("Value:- $value");
                        print("Value12:- ${controller.popupMenuItemIndex.value}");
                        print("Value19:- ${controller.pageIndex.value}");
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          padding: EdgeInsets.zero,
                          child: Center(child: Text(StringsUtils.whatsApp,style: TextStyle(color: AppColors.darkBlue,fontFamily: "Customtext"),)),
                          value: 1,
                        ),
                        PopupMenuItem(
                          padding: EdgeInsets.zero,
                          child: Center(child: Text(StringsUtils.instagram,style: TextStyle(color: AppColors.darkBlue,fontFamily: "Customtext"))),
                          value: 2,
                        ),
                        PopupMenuItem(
                          padding: EdgeInsets.zero,
                          child: Center(child: Text(StringsUtils.telegram,style: TextStyle(color: AppColors.darkBlue,fontFamily: "Customtext"))),
                          value: 3,
                        ),
                        PopupMenuItem(
                          padding: EdgeInsets.zero,
                          child: Center(child: Text(StringsUtils.sms,style: TextStyle(color: AppColors.darkBlue,fontFamily: "Customtext"))),
                          value: 4,
                        ),
                        PopupMenuItem(
                          padding: EdgeInsets.zero,
                          child: Center(child: Text(StringsUtils.snapchat,style: TextStyle(color: AppColors.darkBlue,fontFamily: "Customtext"))),
                          value: 5,
                        ),
                      ],
                    ),
                  ],
                ),
                PopupMenuButton(
                  onSelected: (int value) {
                    if (value == 1) {
                      Get.toNamed(TabBarApp.routeName);
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

Widget contactsAppbar({required String text, IconData? iconData}) {
  return Container(
    color: AppColors.darkBlue,
    child: Padding(
      padding: EdgeInsets.only(
        top: 6.h,
        bottom: 1.h,
        left: 4.w,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                iconData,
                color: Colors.white,
              )),
          SizedBox(
            width: 1.w,
          ),
          DefaultTextStyle(
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
        ],
      ),
    ),
  );
}

Widget usernameAppbar({required String text}) {
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
