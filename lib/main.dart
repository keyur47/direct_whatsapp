import 'package:direct_whatsapp/modules/homepage/homepage.dart';
import 'package:direct_whatsapp/modules/popupmenubutton/history/bottom_navigationbar.dart';
import 'package:direct_whatsapp/modules/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'modules/controller/controller.dart';

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

  IconData? icon;

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
                page: () => const SplashScreen(),
                transition: Transition.leftToRight,
              ),
              GetPage(
                name: HomePage.routeName,
                page: () => HomePage(),
                transition: Transition.leftToRight,
              ),
              GetPage(
                name: TabBarApp.routeName,
                page: () => TabBarApp(),
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
