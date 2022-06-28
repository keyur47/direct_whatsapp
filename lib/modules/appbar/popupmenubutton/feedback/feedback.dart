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

Future FeedbackBox(context) {
  return showModalBottomSheet(
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
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.sp),
            topRight: Radius.circular(30.sp),
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5.w, left: 5.w, top: 5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textField(
                        focusNode: controller.emailFocusNode,
                        boxBorder: Border.all(
                          width: 2,color: AppColors.darkBlue
                        ),
                        controller: controller.emailFeedBackController,
                        hintText: StringsUtils.email,
                        textInputType: TextInputType.text,
                        onTap: () {},
                        maxLines: 1,
                        color: AppColor.backgroundColor,
                        textStyle: TextStyle(color: AppColors.grey, fontSize: 14),
                        style:
                            const TextStyle(fontSize: 16, color: AppColors.black),
                        cursorColor: Colors.black,
                        valueChanged: (val) {
                          controller.validateEmail(val);
                        }),
                    Obx(()=>
                       Text(
                        controller.errorMessage.value,
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 5.w, left: 5.w, top: 1.h),
                child: textField(
                  boxBorder: Border.all(
                    width: 2,color: AppColors.darkBlue),
                  focusNode: controller.passwordFocusNode,
                  controller: controller.FeedBackController,
                  hintText: StringsUtils.feedback,
                  textInputType: TextInputType.text,
                  onTap: () {},
                  maxLines: 4,
                  color: AppColor.backgroundColor,
                  textStyle: TextStyle(color: AppColors.grey, fontSize: 14),
                  style: const TextStyle(fontSize: 16, color: AppColors.black),
                  cursorColor: Colors.black,

                  // validator: (email) {
                  //   if (validateEmail(email)) return null;
                  //   else
                  //     return 'Enter a valid email address';
                  // },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 5.w, left: 5.w, top: 5.h),
                child: ReviewSlider(
                    optionStyle: TextStyle(color: AppColors.darkBlue),
                    onChange: (int value) {
                      print(value);
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.h,left: 28.w,right: 28.w),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.darkBlue, // Background color
                  ),
                  onPressed: () async {
                    if (controller.emailFeedBackController.text.isNotEmpty &&
                        controller.FeedBackController.text.isNotEmpty) {
                      controller.validateEmail(
                          controller.emailFeedBackController.text);
                      await controller.emailFeedBackController.text;
                      await controller.FeedBackController.text;
                      var feedEmail = controller.emailFeedBackController.text;
                      var feed = controller.FeedBackController.text;
                      print("feedEmail:-$feedEmail");
                      print("feed:-$feed");
                      Get.back();
                      controller.emailFeedBackController.clear();
                      controller.FeedBackController.clear();
                    } else {
                      AppSnackBar.showErrorSnackBar(
                        Icon: Icon(Icons.feedback,
                            color: AppColor.backgroundColor),
                        message: StringsUtils.pleaseEmail,
                        title: StringsUtils.sendFeedBack,
                        snackPosition: SnackPosition.TOP,
                      );
                    }
                  },
                  child: Center(
                    child: Row(
                      children: [
                        Icon(Icons.send,color: AppColor.backgroundColor,),
                        SizedBox(width: 1.w,),
                        Text(
                          StringsUtils.sendFeedBack,
                          style: TextStyle(color: AppColor.backgroundColor),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
