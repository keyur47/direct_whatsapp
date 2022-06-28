import 'package:direct_whatsapp/utils/app_color.dart';
import 'package:direct_whatsapp/utils/string_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Future RateBox(context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Column(
          children: [
            Icon(Icons.whatsapp,
                size: 16.w,
                color: AppColor.appColors,
                shadows: [
                  BoxShadow(
                    color: AppColor.appColors.withOpacity(0.8),
                    spreadRadius: 10,
                    blurRadius: 7,
                    offset: const Offset(
                        2, 1),
                  ),
                ]),
            SizedBox(
              height: 1.h,
            ),
            Text(
              StringsUtils.feedBackTitle,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              StringsUtils.feedBackMessages,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13,color: AppColors.grey),
            ),
            SizedBox(
              height: 1.h,
            ),
          ],
        ),
        actions: [
          CupertinoDialogAction(
              onPressed: () {
                Get.back();
              }, child: Text(StringsUtils.feedBackButtonNotNow,style: TextStyle(color: AppColors.green),)),
        ],
        content: Center(
          child: RatingBar.builder(
            initialRating: 1.5,
            minRating: 1,
            itemSize: 2.5.h,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
        ),
      );
    },
  );
}
