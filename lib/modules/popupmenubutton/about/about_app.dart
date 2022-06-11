import 'package:direct_whatsapp/utils/app_color.dart';
import 'package:direct_whatsapp/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.darkBlue,
        title: Text(StringsUtils.aboutApp),
      ),
      body: Padding(
        padding:  EdgeInsets.only(left: 10.w,right: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2)
                ),
                child: Image.asset("assets/image/private.jpg"))
          ],
        ),
      ),
    );
  }
}
