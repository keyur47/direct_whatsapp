import 'dart:async';
import 'package:direct_whatsapp/helper/exception/app_exception.dart';
import 'package:direct_whatsapp/modules/allscreen/whatsapp/whatsapp_screen.dart';
import 'package:direct_whatsapp/utils/app_color.dart';
import 'package:direct_whatsapp/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const routeName = '/splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  List<Color> _kDefaultRainbowColors = const [
    AppColors.black,
  ];
  @override
  void initState() {
    super.initState();
    try {
      startTimeOut();
    } catch (e) {
      AppException.showException(e);
    }
  }
  @override
  void dispose() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.whatsapp,
                  color: AppColor.appColors,
                  size: 90,
                ),
                Text(
                  StringsUtils.whatsAppDirect,
                  style: TextStyle(
                      fontSize: 28,
                      fontFamily: "Customtext",
                      color: AppColors.darkBlue,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5.h),
            child: Container(
              height: 6.h,
              child: LoadingIndicator(
                indicatorType: Indicator.ballPulse,
                colors: _kDefaultRainbowColors,
                backgroundColor: Colors.transparent,
                pathBackgroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void startTimeOut() {
    _timer = Timer.periodic(
      const Duration(seconds: 2),
      (timer) {
        Get.offAllNamed(WhatsApp.routeName);
      },
    );
  }
}
