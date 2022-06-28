import 'dart:math';

import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:direct_whatsapp/helper/shared_preferences.dart';
import 'package:direct_whatsapp/modules/controller/controller.dart';
import 'package:direct_whatsapp/modules/sms/sms.dart';
import 'package:direct_whatsapp/modules/whatsapp/whatsapp.dart';
import 'package:direct_whatsapp/utils/app_color.dart';
import 'package:direct_whatsapp/utils/string_utils.dart';
import 'package:direct_whatsapp/widgets/bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddList extends StatefulWidget {
  @override
  State<AddList> createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  Controller controller = Get.find();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    controller.numberList = await SharedPrefs.getNumberList();
    controller.countryList = await SharedPrefs.getCountryNumberList();
    controller.nameCountryList = await SharedPrefs.getCountryNameList();
    controller.dateTime = await SharedPrefs.getDateTimeList();
    setState(() {
      controller.numberList.join("");
      controller.countryList.join("");
      controller.nameCountryList.join("");
      controller.dateTime.join("");
    });
    print("------------>>>${controller.numberList}");
    print("------------>>>${controller.countryList}");
    print("------------>>>${controller.nameCountryList}");
    print("------------>>>${controller.dateTime}");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.darkBlue,
          title: Text(StringsUtils.contactsHistory),
        ),
        body: Stack(
          children: [
            controller.numberList.isEmpty
                ? Center(
                    child: Image.asset(
                    "assets/image/no_data.png",
                    scale: 5,
                  ))
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        for (var i = 0;
                            i < controller.numberList.length;
                            i++) ...[
                          Padding(
                            padding: EdgeInsets.only(
                                left: 5.w, right: 5.w, top: 1.h),
                            child: Container(
                                height: 7.h,
                                decoration: BoxDecoration(
                                    color: AppColor.backgroundColor,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(width: 1)),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                            context: context,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(25.0),
                                              ),
                                            ),
                                            builder: (context) {
                                              return SizedBox(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Container(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 0.5.h),
                                                        child: ListTile(
                                                          leading: Icon(
                                                              Icons.whatsapp),
                                                          title:
                                                              GestureDetector(
                                                                  onTap: () {
                                                                    controller
                                                                        .numberController
                                                                        .text = controller
                                                                            .numberList[
                                                                        i];
                                                                    // controller
                                                                    //         .data
                                                                    //         .value =
                                                                    //     controller
                                                                    //         .countryList[i];
                                                                    Get.to(
                                                                        WhatsApp());
                                                                  },
                                                                  child: Text(
                                                                      "WhatsApp")),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 0.5.h),
                                                        child: ListTile(
                                                          leading: Icon(
                                                              Icons.message),
                                                          title:
                                                              GestureDetector(
                                                                  onTap: () {
                                                                    controller
                                                                        .smsNumberController
                                                                        .text = controller
                                                                            .numberList[
                                                                        i];
                                                                    controller
                                                                            .data
                                                                            .value =
                                                                        controller
                                                                            .countryList[i];
                                                                    Get.to(
                                                                        SmsNumber());
                                                                  },
                                                                  child: Text(
                                                                      "Messages")),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            });
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 2.w, top: 0.h),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                              Colors.primaries[Random().nextInt(Colors.primaries.length)],
                                              child: Text(
                                                "+${controller.countryList[i]}",
                                                style: TextStyle(
                                                    color: AppColors.white,
                                                    fontSize: 12),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 1.2.h, left: 2.w),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "${controller.numberList[i]}",
                                                      style: TextStyle(
                                                          color:
                                                              AppColors.black,
                                                          fontSize: 16)),
                                                  Row(
                                                    children: [
                                                      Icon(BootstrapIcons.arrow_up_right,size: 12,),
                                                      Text(
                                                          " ${controller.nameCountryList[i].toString()}",
                                                          style: TextStyle(
                                                              color: AppColors.red,
                                                              fontSize: 14)),
                                                      Text(" \u2022 "),
                                                      Text("${controller.dateTime[i]}")

                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(height: 0.5.h)
                        ],
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:whatsdirect/modules/controller/controller.dart';
// import 'package:whatsdirect/widgets/model.dart';
//
// class AddList extends StatefulWidget {
//   const AddList({Key? key}) : super(key: key);
//
//   @override
//   State<AddList> createState() => _AddListState();
// }
//
// class _AddListState extends State<AddList> {
//   Controller controller = Get.find();
//
//   List<List<GraphInfo>> list = [];
//
//   final List<List<GraphInfo>> defaultList = [
//     [
//       GraphInfo(number: "8155734",),
//
//     ],
//
//     // [
//     //   GraphInfo(number: 'dgdfg', code: "dg"),
//     //   GraphInfo(number: 'dfgd', code: "dfg"),
//     // ],
//     // [
//     //   GraphInfo(number: 'dgdfg', code: "dg"),
//     //   GraphInfo(number: 'dfgd', code: "dfg"),
//     // ],
//     // [
//     //   GraphInfo(number: 'dgdfg', code: "dg"),
//     //   GraphInfo(number: 'dfgd', code: "dfg"),
//     // ],
//   ];
//
//   @override
//   void initState() {
//     addToSP(defaultList).then((_) => getSP());
//     super.initState();
//   }
//
//   Future<void> addToSP(List<List<GraphInfo>> tList) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setString('graphLists', jsonEncode(tList));
//   }
//
//   void getSP() async {
//     final prefs = await SharedPreferences.getInstance();
//     final List<dynamic> jsonData =
//         jsonDecode(prefs.getString('graphLists') ?? '[]');
//     list = jsonData.map<List<GraphInfo>>((jsonList) {
//       return jsonList.map<GraphInfo>((jsonItem) {
//         return GraphInfo.fromJson(jsonItem);
//       }).toList();
//     }).toList();
//     setState(() {});
//   }
//
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: list.isNotEmpty
//             ? Center(
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: list.map((subList) {
//                     return subList.isNotEmpty
//                         ? Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children:
//                                 subList.map((x) => Text(x.number)).toList(),
//                           )
//                         : const Text('Empty subList');
//                   }).toList(),
//                 ),
//               )
//             : const Text('NOTHING'),
//       ),
//     );
//   }
// }
