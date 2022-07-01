import 'package:direct_whatsapp/helper/shared_preferences.dart';
import 'package:direct_whatsapp/main.dart';
import 'package:direct_whatsapp/modules/appbar/appbar.dart';
import 'package:direct_whatsapp/modules/controller/all_screen_controller.dart';
import 'package:direct_whatsapp/modules/numberkeyborad/number_keyborad.dart';
import 'package:direct_whatsapp/modules/openbutton/open_call.dart';
import 'package:direct_whatsapp/modules/openbutton/open_number_sms.dart';
import 'package:direct_whatsapp/utils/app_color.dart';
import 'package:direct_whatsapp/utils/string_utils.dart';
import 'package:direct_whatsapp/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Messages extends StatefulWidget {
  static const routeName = '/messages_screen';

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
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
                          controller: controller.callAndMessagesNumberController,
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
                              controller.countryNumber.value = country.dialCode;
                              controller.countryName.value = country.name;
                            });
                            print('Country changed to: ${country.dialCode}');
                            print('Country changed to name: ${country.name}');
                          },
                          onTap: () async {
                            List<String> smsNumber = await SharedPrefs.getNumberList();
                            var SmsNumber = controller.callAndMessagesNumberController.text = smsNumber.last;
                            print("SmsNumber:-  $SmsNumber");
                            List<String> countryNumber = await SharedPrefs.getCountryNumberList();
                            var CountryNumber = controller.countryNumber.value = countryNumber.last;
                            print("countryNumber:-  $CountryNumber");
                            List<String> countryName = await SharedPrefs.getCountryNameList();
                            var CountryName = controller.countryName.value = countryName.last;
                            print("countryName:-  $CountryName");
                          }),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      textField(
                          focusNode: controller.textFocusNode,
                          boxBorder: Border(),
                          controller: controller.messagesNumberTextController,
                          hintText: StringsUtils.typeYourMessage,
                          textInputType: TextInputType.text,
                          onTap: () {
                            showNumericContainer.value = false;
                          },
                          maxLines: 7,
                          color: AppColor.whiteColor,
                          textStyle:
                              TextStyle(color: AppColors.grey, fontSize: 15),
                          style: const TextStyle(
                              fontSize: 16, color: AppColors.grey),
                          cursorColor: Colors.black),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OpenCalls(),
                      SizedBox(
                        width: 6.w,
                      ),
                      OpenSmsNumber(),
                      // SizedBox(
                      //   width: 4.w,
                      // ),
                    ],
                  ),
                ),
                showNumericContainer.value
                    ? NumPad(
                        buttonSize: 15.w,
                        buttonColor: AppColors.darkBlue,
                        iconColor: AppColors.green,
                        controller: controller.callAndMessagesNumberController,
                        delete: () {
                          controller.callAndMessagesNumberController.text =
                              controller.callAndMessagesNumberController.text.substring(
                                  0,
                                  controller.callAndMessagesNumberController.text.length -
                                      1);
                        },
                        clear: () {
                          controller.callAndMessagesNumberController.clear();
                        },
                        onSubmit: () {
                          debugPrint(
                              'Your code: ${controller.callAndMessagesNumberController.text}');
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              content: Text(
                                "You code is ${controller.callAndMessagesNumberController.text}",
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
