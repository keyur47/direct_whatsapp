import 'package:direct_whatsapp/modules/controller/controller.dart';
import 'package:direct_whatsapp/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';

Widget phoneNumberTextField({
  required TextEditingController? controller,
  required bool? showCursor,
  // required FocusNode? focusNode,
  required String? hintText,
  required TextInputType textInputType,
  required ValueChanged<Country>? valueChanged,
  required GestureTapCallback onTap,
  required VoidCallback onTapV,
}) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.h), color: Colors.white),
    child: IntlPhoneField(
      onTap: onTapV,
      disableLengthCheck: true,
      dropdownIconPosition: IconPosition.leading,
      dropdownIcon: const Icon(
        Icons.arrow_drop_down,
        color: AppColors.darkBlue,
      ),
      flagsButtonMargin:
          EdgeInsets.only(right: 3.w, top: 2.w, bottom: 2.w, left: 3.w),
      dropdownDecoration: const BoxDecoration(
        border: Border(right: BorderSide(color: Colors.grey, width: 1)),
      ),
      onCountryChanged: valueChanged,
      initialCountryCode: "",
      dropdownTextStyle: const TextStyle(color: AppColors.grey, fontSize: 16),
      showDropdownIcon: true,
      showCountryFlag: false,
      invalidNumberMessage: "",
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        isCollapsed: true,
        suffixIcon: GestureDetector(
            onTap: onTap,
            child: const Icon(
              Icons.history,
              color: AppColors.green,
            )),
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.grey),
      ),
      controller: controller,
      showCursor: showCursor,
      style: const TextStyle(fontSize: 16, color: AppColors.black),
      keyboardType: textInputType,
      cursorColor: Colors.black,
    ),
  );
}


Controller controller = Get.find();
///
Widget textField({required TextEditingController? controller,required int maxLines,required Color color,required TextStyle textStyle,required TextStyle style,
    //bool? showCursor,
    required FocusNode? focusNode,
    required String? hintText,required Color cursorColor,
    required TextInputType textInputType,
  required BoxBorder? boxBorder,
  ValueChanged<String>? valueChanged,
  FormFieldValidator<String>? validator,
  Widget? suffixIcon,
    required VoidCallback onTap}) {
  return Container(
    decoration: BoxDecoration(
      border: boxBorder,
        color: color, borderRadius: BorderRadius.circular(2.w)),
    child: Padding(
      padding: EdgeInsets.only(left: 2.w),
      child: TextFormField(
        onTap: onTap,
        maxLines: maxLines,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: textStyle,
          suffixIcon: suffixIcon
        ),
        controller: controller,
        onChanged: valueChanged,
        // showCursor: showCursor,
        style: style,
        keyboardType: textInputType,
        validator: validator,
        // focusNode: focusNode,
        cursorColor: cursorColor,
      ),
    ),
  );
}
