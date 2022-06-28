import 'package:direct_whatsapp/helper/shared_preferences.dart';
import 'package:direct_whatsapp/main.dart';
import 'package:direct_whatsapp/modules/appbar/appbar.dart';
import 'package:direct_whatsapp/modules/controller/controller.dart';
import 'package:direct_whatsapp/modules/numberkeyborad/number_keyborad.dart';
import 'package:direct_whatsapp/modules/openbutton/sms.dart';
import 'package:direct_whatsapp/utils/app_color.dart';
import 'package:direct_whatsapp/utils/string_utils.dart';
import 'package:direct_whatsapp/widgets/bottom_navigation_bar.dart';
import 'package:direct_whatsapp/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SmsNumber extends StatefulWidget {
  static const routeName = '/homePage_screen';

  @override
  _SmsNumberState createState() => _SmsNumberState();
}

class _SmsNumberState extends State<SmsNumber> {
  Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                customAppbar(
                  text: StringsUtils.smsDirects,
                  icon: Icons.message,
                  iconColor: AppColors.white,
                  iconColors: AppColors.white,
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                      colors: [AppColors.darkBlue, AppColors.darkBlue]),
                  top: 0.7.h,
                  bottom: 0.5.h,
                  right: 1.5.w,
                  left: 1.4.w,
                  size: 8.w,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 2.w),
                  child: Column(
                    children: [
                      phoneNumberTextField(
                          controller: controller.smsNumberController,
                          showCursor: false,
                          onTapV: () async {
                            FocusScope.of(context).unfocus();
                            await Future.delayed(
                                const Duration(milliseconds: 200));
                            showNumericContainer.value = true;
                          },
                          // focusNode: controller.focusNodes,
                          hintText: StringsUtils.phoneNumber,
                          textInputType: TextInputType.none,
                          valueChanged: (country) {
                            setState(() {
                              controller.data.value = country.dialCode;
                              controller.countryName.value = country.name;
                            });
                            print('Country changed to: ${country.dialCode}');
                            print('Country changed to name: ${country.name}');
                          },
                          onTap: () async {
                            List<String> data =
                                await SharedPrefs.getNumberList();
                            var dataType =
                                controller.smsNumberController.text = data.last;
                            print("dataType:-  $dataType");
                            List<String> data1 =
                                await SharedPrefs.getCountryNumberList();
                            var dataType1 =
                                controller.data.value = data1.last;
                            print("dataType:-  $dataType1");
                          }),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      textField(
                          focusNode: controller.confirmFocusNode,
                          boxBorder: Border(),
                          controller: controller.smsTextController,
                          hintText: StringsUtils.typeYourMessage,
                          textInputType: TextInputType.text,
                          onTap: () {
                            showNumericContainer.value = false;
                          },
                          maxLines: 7,
                          color: AppColor.whiteColor,
                          textStyle:
                              TextStyle(color: AppColors.grey, fontSize: 14),
                          style: const TextStyle(
                              fontSize: 16, color: AppColors.grey),
                          cursorColor: Colors.black),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Sms(),
                  ],
                ),
                showNumericContainer.value
                    ? NumPad(
                        buttonSize: 15.w,
                        buttonColor: AppColors.darkBlue,
                        iconColor: AppColors.green,
                        controller: controller.smsNumberController,
                        delete: () {
                          controller.smsNumberController.text =
                              controller.smsNumberController.text.substring(
                                  0,
                                  controller.smsNumberController.text.length -
                                      1);
                        },
                        clear: () {
                          controller.smsNumberController.clear();
                        },
                        onSubmit: () {
                          debugPrint(
                              'Your code: ${controller.smsNumberController.text}');
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              content: Text(
                                "You code is ${controller.smsNumberController.text}",
                                style: const TextStyle(fontSize: 30),
                              ),
                            ),
                          );
                        },
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
