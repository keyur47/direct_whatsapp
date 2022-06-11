import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget button(
    {required String text,
    required VoidCallback onTap,
     IconData? iconData,
    required Color textColor,
    required Color boxColor,
    required Color iconColor}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
          color: boxColor, borderRadius: BorderRadius.circular(10.w)),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 2.5.w, right: 2.5.w,top: 1.5.h,bottom: 1.5.h),
          child: Row(
            children: [
              Icon(
                iconData,
                color: iconColor,
              ),
              SizedBox(
                width: 1.w,
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: textColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
