import 'package:direct_whatsapp/modules/homepage/homepage.dart';
import 'package:direct_whatsapp/utils/app_color.dart';
import 'package:direct_whatsapp/utils/string_utils.dart';
import 'package:direct_whatsapp/modules/popupmenubutton/history/contacts/contacts_number.dart';
import 'package:direct_whatsapp/modules/popupmenubutton/history/username/username_telegram.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TabBarApp extends StatefulWidget {
  static const routeName = '/tabbar_screen';

  @override
  _TabBarAppState createState() => _TabBarAppState();
}

class _TabBarAppState extends State<TabBarApp> {
  int currentTab = 0;

  final List<Widget> screens = [AddList(),UserName()];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = AddList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.darkBlue,
          child: Icon(Icons.home),
          onPressed: () {
            Get.offAllNamed(HomePage.routeName);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: AppColor.backgroundColor,
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 60,
            child: Padding(
              padding: EdgeInsets.only(left: 6.w,right: 6.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            currentScreen = AddList();
                            currentTab = 0;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.people_alt_rounded,
                              color: currentTab == 0 ? AppColors.red : AppColors.darkBlue,
                            ),
                            Text(
                              StringsUtils.contacts,
                              style: TextStyle(
                                color: currentTab == 0 ?AppColors.red : AppColors.darkBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            currentScreen = UserName();
                            currentTab = 1;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.supervised_user_circle_sharp,
                              color: currentTab == 1 ? AppColors.red : AppColors.darkBlue,
                            ),
                            Text(
                              StringsUtils.userName,
                              style: TextStyle(
                                color: currentTab == 1 ?AppColors.red : AppColors.darkBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
