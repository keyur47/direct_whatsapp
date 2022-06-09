import 'package:direct_whatsapp/helper/shared_preferences.dart';
import 'package:direct_whatsapp/main.dart';
import 'package:direct_whatsapp/modules/homepage/numberkeyboard/num_pad.dart';
import 'package:direct_whatsapp/modules/openbutton/open_telegram.dart';
import 'package:direct_whatsapp/modules/openbutton/open_whatsapp.dart';
import 'package:direct_whatsapp/modules/openbutton/share_location.dart';
import 'package:direct_whatsapp/modules/openbutton/username_telegram.dart';
import 'package:direct_whatsapp/modules/popupmenubutton/feedback/feedback.dart';
import 'package:direct_whatsapp/modules/popupmenubutton/rate/rate.dart';
import 'package:direct_whatsapp/modules/popupmenubutton/share/shareapp.dart';
import 'package:direct_whatsapp/utils/app_color.dart';
import 'package:direct_whatsapp/utils/string_utils.dart';
import 'package:direct_whatsapp/widgets/custom_textfield.dart';
import 'package:direct_whatsapp/modules/popupmenubutton/history/bottom_navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../controller/controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/homePage_screen';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        resizeToAvoidBottomInset: false,
        body: Obx(
          () => Container(
            child: Padding(
              padding: EdgeInsets.only(
                top: 2.w,
                left: 5.w,
                // right: 5.w,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
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
                                      2, 1), // changes position of shadow
                                ),
                              ]),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            StringsUtils.whatsDirects,
                            style: TextStyle(
                                fontSize: 20,
                                color: AppColors.darkBlue,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      PopupMenuButton(
                        onSelected: (int value) {
                          if (value == 1) {
                            Get.to(TabBarApp());
                          } else if (value == 2) {
                            Share();
                          } else if (value == 3) {
                            RateBox(context);
                          } else if (value == 4) {
                            FeedbackBox(context);
                          } else {
                          }
                          print("Value:- $value");
                        },
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Text(StringsUtils.history),
                            value: 1,
                          ),
                          PopupMenuItem(
                            child: Text(StringsUtils.shareApp),
                            value: 2,
                          ),
                          PopupMenuItem(
                            child: Text(StringsUtils.rateApp),
                            value: 3,
                          ),
                          PopupMenuItem(
                            child: Text(StringsUtils.feedback),
                            value: 4,
                          ),
                          PopupMenuItem(
                            child: Text(StringsUtils.termsAndPrivacy),
                            value: 5,
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 1.h, right: 5.w),
                    child: Column(
                      children: [
                        InkWell(
                          child: phoneNumberTextField(
                              controller: controller.myController,
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
                                print(
                                    'Country changed to: ${country.dialCode}');
                                print(
                                    'Country changed to name: ${country.name}');
                              },
                              onTap: () async {
                                List<String> data =
                                    await SharedPrefs.getNumberList();
                                var dataType =
                                    controller.myController.text = data.last;
                                print("dataType:-  $dataType");
                                List<String> data1 =
                                    await SharedPrefs.getCountryNumberList();
                                var dataType1 =
                                    controller.data.value = data1.last;
                                print("dataType:-  $dataType1");
                                // var data =  controller.myController.text = AppSharedPreference.lastNumber.toString();
                                // // AppSharedPreference.clear();
                                //   controller.data.value = AppSharedPreference.lastNumberCode.toString();
                              }),
                          onTap: () {
                            // Get.to(AddList());
                          },
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        textField(
                            focusNode: controller.confirmFocusNode,
                            boxBorder: Border(),
                            controller: controller.textController,
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
                        SizedBox(
                          height: 1.5.h,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             OpenWhatsApp(),
                              SizedBox(
                                width: 4.w,
                              ),
                             ShareLocationWhatsApp(),
                              SizedBox(
                                width: 4.w,
                              ),
                              OpenTelegram(),
                              SizedBox(
                                width: 4.w,
                              ),
                              UserNameTelegram(),
                            ],
                          ),
                        ),
                        showNumericContainer.value
                            ? NumPad(
                                buttonSize: 15.w,
                                buttonColor: AppColors.darkBlue,
                                iconColor: AppColors.green,
                                controller: controller.myController,
                                delete: () {
                                  controller.myController.text =
                                      controller.myController.text.substring(
                                          0,
                                          controller.myController.text.length -
                                              1);
                                },
                                clear: () {
                                  controller.myController.clear();
                                },
                                onSubmit: () {
                                  debugPrint(
                                      'Your code: ${controller.myController.text}');
                                  showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      content: Text(
                                        "You code is ${controller.myController.text}",
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
