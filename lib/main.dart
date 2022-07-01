import 'package:direct_whatsapp/modules/allscreen/instagram/instagram_screen.dart';
import 'package:direct_whatsapp/modules/allscreen/messages/messages_screen.dart';
import 'package:direct_whatsapp/modules/allscreen/telegram/telegram_screen.dart';
import 'package:direct_whatsapp/modules/allscreen/whatsapp/whatsapp_screen.dart';
import 'package:direct_whatsapp/modules/appbar/popupmenubutton/feedback/feedback.dart';
import 'package:direct_whatsapp/modules/appbar/popupmenubutton/history/bottom_navigationbar.dart';
import 'package:direct_whatsapp/modules/appbar/popupmenubutton/history/contacts/chat/chat_history.dart';
import 'package:direct_whatsapp/modules/appbar/popupmenubutton/history/contacts/contacts_number.dart';
import 'package:direct_whatsapp/modules/splash/splash_screen.dart';
import 'package:direct_whatsapp/utils/my_behavior.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'modules/controller/all_screen_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPrefs.numberList(['123', '456']);
  // List<String> data = await SharedPrefs.getNumberList();
  // print("------------>>> ${data.join('').toString()}");
  runApp(MyApp());
}

RxBool showNumericContainer = true.obs;

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GestureDetector(
          onTap: () async {
            WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
            await Future.delayed(const Duration(milliseconds: 200));
            showNumericContainer.value = true;
          },
          child: GetMaterialApp(
            builder: (context, child) {
              return ScrollConfiguration(
                behavior: MyBehavior(),
                child: child!,
              );
            },
            theme: ThemeData(
                colorScheme: Theme.of(context)
                    .colorScheme
                    .copyWith(secondary: Colors.red)),
            debugShowCheckedModeBanner: false,
            initialRoute: SplashScreen.routeName,
            initialBinding: AppBidding(),
            getPages: [
              GetPage(
                name: SplashScreen.routeName,
                page: () => SplashScreen(),
                transition: Transition.leftToRight,
              ),
              GetPage(
                name: WhatsApp.routeName,
                page: () => WhatsApp(),
                transition: Transition.leftToRight,
              ),
              GetPage(
                name: Instagram.routeName,
                page: () => Instagram(),
                transition: Transition.leftToRight,
              ),
              GetPage(
                name: Telegram.routeName,
                page: () => Telegram(),
                transition: Transition.leftToRight,
              ),
              GetPage(
                name: Messages.routeName,
                page: () => Messages(),
                transition: Transition.leftToRight,
              ),
              GetPage(
                name: TabBarApp.routeName,
                page: () => TabBarApp(),
                transition: Transition.leftToRight,
              ),
              GetPage(
                name: ContactsList.routeName,
                page: () => ContactsList(),
                transition: Transition.leftToRight,
              ),
            ],
          ),
        );
      },
    );
  }
}

class AppBidding implements Bindings {
  @override
  void dependencies() {
    Get.put(Controller());
  }
}
