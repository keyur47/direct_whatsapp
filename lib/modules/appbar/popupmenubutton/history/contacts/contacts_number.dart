import 'dart:developer';
import 'dart:math';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:direct_whatsapp/helper/shared_preferences.dart';
import 'package:direct_whatsapp/modules/allscreen/messages/sms_screen.dart';
import 'package:direct_whatsapp/modules/allscreen/whatsapp/whatsapp_screen.dart';
import 'package:direct_whatsapp/modules/appbar/appbar.dart';
import 'package:direct_whatsapp/modules/controller/all_screen_controller.dart';
import 'package:direct_whatsapp/utils/app_color.dart';
import 'package:direct_whatsapp/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ContactsList extends StatefulWidget {
  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
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
    controller.day = await SharedPrefs.getDayList();
    controller.type = await SharedPrefs.getTypeList();
    // controller.numberList.removeWhere((item) => item == articleId);
    // controller.getNumberList = controller.numberList.toSet().toList();
    setState(() {
      controller.numberList.join("");
      controller.countryList.join("");
      controller.nameCountryList.join("");
      controller.dateTime.join("");
      controller.day.join("");
      controller.type.join("");
      // controller.getNumberList.join("");
    });
    print("------------>>>${controller.numberList}");
    print("------------>>>${controller.countryList}");
    print("------------>>>${controller.nameCountryList}");
    print("------------>>>${controller.dateTime}");
    print("------day------>>>${controller.day}");
    print("------getNumberList------>>>${controller.getNumberList}");
    print("------type----->>>${controller.type}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      // appBar: AppBar(
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      //   backgroundColor: AppColor.whiteColor,
      //   title: Text(StringsUtils.contactsHistory),
      // ),
      body: Stack(
        children: [
          dataAppbar(text: "${StringsUtils.contactsHistory}"),
          controller.numberList.isEmpty
              ? Center(
                  child: Image.asset(
                  "assets/image/no_data.png",
                  scale: 5,
                ))
              : Padding(
                padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 12.h),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: controller.numberList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SwipeActionCell(
                          key: ObjectKey(
                            controller.numberList[index],
                          ),
                          trailingActions: <SwipeAction>[
                            SwipeAction(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onTap: (CompletionHandler handler) async {
                                  // controller.numberList[index] = await SharedPrefs.remove().toString();
                                  //  SharedPreferences preferences = await SharedPreferences.getInstance();
                                  //  preferences.getKeys().toString();
                                  //  preferences.remove("numberList");
                                  // controller.numberList[index] = await SharedPrefs.remove().toString();
                                   await controller.numberList.removeAt(index)[index];
                                   setState((){});
                                   print("wfdsdfs${controller.numberList[index]}");
                                   // await SharedPrefs.remove();
                                },
                                color: Colors.transparent),
                          ],
                          child: Container(
                              height: 7.h,
                              decoration: BoxDecoration(
                                  color: AppColor.backgroundColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 1)),
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(25.0),
                                        ),
                                      ),
                                      builder: (context) {
                                        return SizedBox(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Container(
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 0.5.h),
                                                  child: ListTile(
                                                    leading: Icon(
                                                        Icons.whatsapp),
                                                    title: GestureDetector(
                                                        onTap: () {
                                                          controller
                                                              .numberController
                                                              .text = controller
                                                                  .numberList[
                                                              index];
                                                          controller.data
                                                                  .value =
                                                              controller
                                                                      .countryList[
                                                                  index];
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
                                                  padding: EdgeInsets.only(
                                                      bottom: 0.5.h),
                                                  child: ListTile(
                                                    leading:
                                                        Icon(Icons.message),
                                                    title: GestureDetector(
                                                        onTap: () {
                                                          controller
                                                              .smsNumberController
                                                              .text = controller
                                                                  .numberList[
                                                              index];
                                                          controller.data
                                                                  .value =
                                                              controller
                                                                      .countryList[
                                                                  index];
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
                                      left: 2.w, right: 2.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                      backgroundColor:  Colors.primaries[Random().nextInt(Colors.primaries.length)],
                                        child: Text(
                                          "+${controller.countryList[index]}",
                                          style: TextStyle(
                                              color: AppColors.white,
                                              fontSize: 12),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.2.h, left: 2.w),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "${controller.numberList[index]}",
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.black,
                                                      fontSize: 16)),
                                              Row(
                                                children: [
                                                  Icon(
                                                    BootstrapIcons
                                                        .arrow_up_right,
                                                    size: 12,
                                                  ),
                                                  Text(
                                                      " ${controller.nameCountryList[index].toString()}",
                                                      style: TextStyle(
                                                          color:
                                                              AppColors.red,
                                                          fontSize: 14)),
                                                  Text(" \u2022 "),
                                                  Text(
                                                    "${(controller.dateTime[index])}",
                                                    style: TextStyle(
                                                        fontSize: 13),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text("${controller.day[index]}"),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Icon(
                                            Icons.info_outline,
                                            size: 6.w,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 1.h,
                        )
                      ],
                    );
                  },
                ),
              ),
        ],
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
// import 'package:whatsdirect/modules/controller/all_screen_controller.dart';
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
