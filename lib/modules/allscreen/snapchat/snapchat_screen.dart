import 'package:direct_whatsapp/modules/appbar/appbar.dart';
import 'package:direct_whatsapp/modules/controller/all_screen_controller.dart';
import 'package:direct_whatsapp/modules/openbutton/oepn_username_snapchat.dart';
import 'package:direct_whatsapp/utils/app_color.dart';
import 'package:direct_whatsapp/utils/string_utils.dart';
import 'package:direct_whatsapp/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Snapchat extends StatefulWidget {
  static const routeName = '/snapchat_screen';

  @override
  _SnapchatState createState() => _SnapchatState();
}

class _SnapchatState extends State<Snapchat> {
  Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              customAppbar(
                text: StringsUtils.snapchatDirects,
                icon: Icons.snapchat,
                iconColor: Colors.white,
                iconColors: Colors.white,
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.darkBlue,
                      AppColors.darkBlue,

                    ]),
                top: 0.4.h,
                bottom: 0.5.h,
                right: 1.w,
                left: 1.1.w,
                size: 10.w,
                directText: StringsUtils.snapchatDirects,
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 2.w),
                child: Column(
                  children: [
                    usernameTextField(
                        controller: controller.snapchatUsernameController,
                        showCursor: false,
                        hintText: StringsUtils.username,
                        textInputType: TextInputType.none,
                        onTap: () async {
                          controller.snapchatUsernameController.clear();
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [OpenUserNameSnapchat()],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
