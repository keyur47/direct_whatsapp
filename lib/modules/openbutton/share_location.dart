import 'package:direct_whatsapp/helper/shared_preferences.dart';
import 'package:direct_whatsapp/modules/controller/controller.dart';
import 'package:direct_whatsapp/utils/app_color.dart';
import 'package:direct_whatsapp/utils/appsnackbar.dart';
import 'package:direct_whatsapp/utils/string_utils.dart';
import 'package:direct_whatsapp/widgets/button_box.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class ShareLocationWhatsApp extends StatelessWidget {
  ShareLocationWhatsApp({Key? key}) : super(key: key);

  Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return button(
        onTap: () async {
          if (controller.myController.text.isNotEmpty) {
            if (controller.data.isNotEmpty) {
              controller.numberList.addAll([controller.myController.text]);
              await SharedPrefs.setNumberList(controller.numberList);
              print("object${controller.numberList}");
              controller.countryList.addAll([controller.data.value]);
              await SharedPrefs.setCountryNumberList(controller.countryList);
              print("CountryObject${controller.countryList}");
              controller.nameCountryList.addAll([controller.countryName.value]);
              await SharedPrefs.setCountryNameList(controller.nameCountryList);
              print("CountryObjectName${controller.nameCountryList}");
              await Geolocator.requestPermission();
              if (await Permission.location.isGranted) {
                Position? position;
                try {
                  position = await Geolocator.getCurrentPosition(
                    desiredAccuracy: LocationAccuracy.bestForNavigation,
                    timeLimit: const Duration(seconds: 5),
                  );
                  var urls =
                      "https://www.google.com/maps/?q=${position.latitude},${position.longitude}"
                          .toString();
                  final url =
                      "https://wa.me/+${controller.data.value}${controller.myController.text}?text=See my real-time location on Maps:$urls";
                  await launch(url);
                  print("Location$url");
                  print("Location121$urls");
                } catch (e) {}
              }
            } else {
              AppSnackBar.showErrorSnackBar(
                Icon: Icon(Icons.location_on_outlined,color: Colors.green),
                message: "Please enter Country Code",
                title: StringsUtils.shareLocation,
                snackPosition: SnackPosition.TOP,
              );
            }
          } else {
            AppSnackBar.showErrorSnackBar(
              Icon: Icon(Icons.location_on_outlined,color: Colors.green),
              message: "Please enter Phone Number",
              title: StringsUtils.shareLocation,
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        },
        text: StringsUtils.shareLocation,
        iconData: Icons.location_on_outlined,
        boxColor: AppColor.whiteColor,
        textColor: AppColors.black,
        iconColor: AppColors.green);
  }
}
