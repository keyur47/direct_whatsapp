import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:direct_whatsapp/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:neon/neon.dart';
import 'package:sizer/sizer.dart';

Widget button(
    {required String text,
    required VoidCallback onTap,
    IconData? iconData,
    required Color textColor,
    required Color boxColor,
    Color? ImageColor,
    double? scale,
    required double left,
    required double right,
    required double top,
    required double bottom,
    double? width,
    bool? obscure,
    Decoration? decoration,
    String? image,
    double? sizeIcon,
    required Color iconColor}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
          color: boxColor, borderRadius: BorderRadius.circular(10.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(4, 8), // Shadow position
            ),
          ]
      ),
      child:Padding(
        padding: EdgeInsets.only(
            left: left, right: right, top: top, bottom: bottom),
        child: Container(
          child: Center(
            child: Row(
              children: [
                Container(
                        decoration: decoration,
                        child: Icon(iconData, color: iconColor, size: sizeIcon)),
                SizedBox(
                  width: 1.w,
                ),
                // Neon(
                //   textStyle: TextStyle(),
                //   text: text,
                //   color: Colors.red,
                //   fontSize: 18,
                //   font: NeonFont.Beon,
                //   flickeringText: true,
                //   flickeringLetters: null,
                //   glowingDuration: Duration(seconds: 1),
                // ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: left, right: right, top: top, bottom: bottom),
                      child: Text(text,style: TextStyle(color: Colors.transparent,fontSize: 15),),
                    ),
                    DefaultTextStyle(
                      style: const TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'Customtext',
                          color: AppColors.darkBlue),
                      child: AnimatedTextKit(
                        pause: Duration(milliseconds: 100),
                        animatedTexts: [
                          TypewriterAnimatedText(text),
                        ],
                        onTap: onTap,
                      ),
                    ),
                  ],
                ),
                // Text(
                //   text,
                //   style: TextStyle(
                //       fontSize: 15,
                //       fontWeight: FontWeight.w300,
                //       color: textColor),
                //   textAlign: TextAlign.center,
                // ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
