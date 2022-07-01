import 'package:direct_whatsapp/modules/appbar/appbar.dart';
import 'package:direct_whatsapp/modules/numberkeyborad/number_keyborad.dart';
import 'package:direct_whatsapp/modules/openbutton/open_number-share_location_whatsapp.dart';
import 'package:direct_whatsapp/modules/openbutton/open_number_whatsapp.dart';
import 'package:direct_whatsapp/modules/controller/all_screen_controller.dart';
import 'package:direct_whatsapp/helper/shared_preferences.dart';
import 'package:direct_whatsapp/widgets/custom_textfield.dart';
import 'package:direct_whatsapp/utils/app_color.dart';
import 'package:direct_whatsapp/utils/string_utils.dart';
import 'package:direct_whatsapp/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class WhatsApp extends StatefulWidget {
  static const routeName = '/whatsapp_screen';
  @override
  _WhatsAppState createState() => _WhatsAppState();
}

class _WhatsAppState extends State<WhatsApp> {
  Controller controller = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Obx(
                  () => Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          customAppbar(text: StringsUtils.whatsDirects,icon: Icons.whatsapp,iconColor: AppColor.whiteColor,iconColors: AppColor.whiteColor,gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomRight,colors: [
                            Color(0xFF5FFC7B),
                            Color(0xFF28D146),
                          ]),
                            top: 0.4.h,
                            bottom: 0.5.h,
                            right: 1.1.w,
                            left: 1.1.w,
                            size: 10.w,

                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 4.w,right: 4.w,top: 2.w),
                            child: Column(
                              children: [
                                phoneNumberTextField(
                                    controller: controller.contactsNumberController,
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
                                      print(
                                          'Country changed to: ${country.dialCode}');
                                      print(
                                          'Country changed to name: ${country.name}');
                                    },
                                    onTap: () async {
                                      List<String> Number = await SharedPrefs.getNumberList();
                                      var number = controller.contactsNumberController.text = Number.last;
                                      print("Number:-  $number");
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
                                    controller: controller.contactsNumberTextController,
                                    hintText: StringsUtils.typeYourMessage,
                                    textInputType: TextInputType.text,
                                    onTap: () {
                                      showNumericContainer.value = false;
                                    },
                                    maxLines: 7,
                                    color: AppColor.whiteColor,
                                    textStyle:
                                        TextStyle(color: AppColors.grey, fontSize: 15,),
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
                                OpenWhatsAppNumber(),
                                SizedBox(
                                  width: 2.w,
                                ),
                                 OpenShareLocationWhatsAppNumber(),
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
                                  controller: controller.contactsNumberController,
                                  delete: () {
                                    controller.contactsNumberController.text =
                                        controller.contactsNumberController.text.substring(
                                            0,
                                            controller.contactsNumberController.text.length -
                                                1);
                                  },
                                  clear: () {
                                    controller.contactsNumberController.clear();
                                  },
                                  onSubmit: () {
                                    debugPrint(
                                        'Your code: ${controller.contactsNumberController.text}');
                                    showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                        content: Text(
                                          "You code is ${controller.contactsNumberController.text}",
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
        ],
      ),
    );
  }
}
