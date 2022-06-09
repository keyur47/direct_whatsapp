import 'package:direct_whatsapp/modules/controller/controller.dart';
import 'package:direct_whatsapp/utils/app_color.dart';
import 'package:direct_whatsapp/utils/appsnackbar.dart';
import 'package:direct_whatsapp/utils/string_utils.dart';
import 'package:direct_whatsapp/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reviews_slider/reviews_slider.dart';
import 'package:sizer/sizer.dart';


Controller controller = Get.find();

Future FeedbackBox(context){
  return   showModalBottomSheet(
    isDismissible: false,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.sp),
        topRight: Radius.circular(30.sp),
      ),
    ),
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Container(
        height: 60.h,
        decoration: BoxDecoration(
          color: AppColors.darkBlue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.sp),
            topRight: Radius.circular(30.sp),
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: 5.w, left: 5.w, top: 5.h),
                child: textField(
                    focusNode:
                    controller.emailFocusNode,
                    boxBorder: Border.all(width: 2,),
                    controller: controller
                        .emailFeedBackController,
                    hintText: StringsUtils.email,
                    textInputType: TextInputType.text,
                    onTap: () {},
                    maxLines: 1,
                    color: AppColor.backgroundColor,
                    textStyle: TextStyle(
                        color: AppColors.grey,
                        fontSize: 14),
                    style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.black),
                    cursorColor: Colors.black),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: 5.w, left: 5.w, top: 1.h),
                child: textField(
                    boxBorder: Border.all(width: 2),
                    focusNode:
                    controller.passwordFocusNode,
                    controller:
                    controller.FeedBackController,
                    hintText: StringsUtils.feedback,
                    textInputType: TextInputType.text,
                    onTap: () {},
                    maxLines: 4,
                    color: AppColor.backgroundColor,
                    textStyle: TextStyle(
                        color: AppColors.grey,
                        fontSize: 14),
                    style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.black),
                    cursorColor: Colors.black),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: 5.w, left: 5.w, top: 5.h),
                child: ReviewSlider(
                  optionStyle: TextStyle(color: AppColor.whiteColor),
                    onChange: (int value) {
                      print(value);
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppColor.backgroundColor, // Background color
                    ),
                    onPressed: () async {
                      if (controller
                          .emailFeedBackController
                          .text
                          .isNotEmpty &&
                          controller
                              .FeedBackController
                              .text
                              .isNotEmpty) {
                        await controller
                            .emailFeedBackController
                            .text;
                        await controller
                            .FeedBackController.text;
                        var feedEmail = controller
                            .emailFeedBackController
                            .text;
                        var feed = controller
                            .FeedBackController.text;
                        print(
                            "feedEmail:-$feedEmail");
                        print("feed:-$feed");
                        Get.back();
                        controller.emailFeedBackController.clear();
                        controller.FeedBackController.clear();
                      } else {
                        AppSnackBar.showErrorSnackBar(
                          Icon: Icon(Icons.feedback,color: AppColor.backgroundColor),
                          message:
                          "Please Enter Email & Feedback",
                          title:  StringsUtils.sendFeedBack,
                          snackPosition:
                          SnackPosition.TOP,
                        );
                      }
                    },
                    child: Text(
                        StringsUtils.sendFeedBack,style: TextStyle(color: AppColors.darkBlue),)),
              )
            ],
          ),
        ),
      );
    },
  );
}