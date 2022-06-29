import 'package:direct_whatsapp/helper/shared_preferences.dart';
import 'package:direct_whatsapp/modules/controller/all_screen_controller.dart';
import 'package:direct_whatsapp/modules/allscreen/instagram/instagram_screen.dart';
import 'package:direct_whatsapp/modules/allscreen/telegram/telegram_screen.dart';
import 'package:direct_whatsapp/modules/allscreen/whatsapp/whatsapp_screen.dart';
import 'package:direct_whatsapp/utils/app_color.dart';
import 'package:direct_whatsapp/utils/string_utils.dart';
import 'package:direct_whatsapp/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class UserName extends StatefulWidget {
  UserName({Key? key}) : super(key: key);
  static const routeName = '/username_screen';

  @override
  State<UserName> createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  Controller controller = Get.find();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    controller.nameTelegramList = await SharedPrefs.getUserNameList();
    setState(() {
      controller.nameTelegramList.join("");
    });
    print("------------>>>${controller.nameTelegramList}");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.darkBlue,
          title: Text(StringsUtils.userNameHistory),
        ),
        body: Stack(
          children: [
            controller.nameTelegramList.isEmpty
                ? Center(child: Image.asset("assets/image/no_data.png",scale: 5,))
                : SingleChildScrollView(
                  child: Column(
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        for (var i = 0;
                            i < controller.nameTelegramList.length;
                            i++) ...[
                          Padding(
                            padding:
                                EdgeInsets.only(left: 5.w, right: 5.w, top: 1.h),
                            child: Container(
                              height: 4.h,
                              decoration: BoxDecoration(
                                  color: AppColor.backgroundColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 1)),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 2.w,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.vertical(
                                            top: Radius.circular(25.0),
                                          ),
                                        ),
                                        builder: (context) {
                                          return SizedBox(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              mainAxisSize:
                                              MainAxisSize.min,
                                              children: <Widget>[
                                                Container(
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsets.only(
                                                        top: 0.5.h),
                                                    child: ListTile(
                                                      leading: Icon(
                                                          Icons.whatsapp),
                                                      title:
                                                      GestureDetector(
                                                          onTap: () {
                                                            controller.telegramUsernameController.text =
                                                            controller.nameTelegramList[i];
                                                            Get.to(Telegram());
                                                          },
                                                          child: Text(
                                                              "Telegram")),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsets.only(
                                                        bottom: 0.5.h),
                                                    child: ListTile(
                                                      leading: Icon(
                                                          Icons.message),
                                                      title:
                                                      GestureDetector(
                                                          onTap: () {
                                                            controller.instagramUsernameController.text =
                                                            controller.nameTelegramList[i];
                                                            Get.to(
                                                                Instagram());
                                                          },
                                                          child: Text(
                                                              "Instagram")),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.arrow_forward),
                                      Padding(
                                        padding: EdgeInsets.only(left: 2.w),
                                        child: Text(
                                          "${controller.nameTelegramList[i]}",
                                          style: TextStyle(
                                              color: AppColors.black,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 0.5.h)
                        ],
                      ],
                    ),
                ),
          ],
        ),
      ),
    );
  }
}