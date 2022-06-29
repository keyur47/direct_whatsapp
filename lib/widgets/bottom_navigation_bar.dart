// import 'package:bottom_navy_bar/bottom_navy_bar.dart';
// import 'package:direct_whatsapp/modules/whatsapp/whatsapp_screen.dart';
// import 'package:direct_whatsapp/modules/instagram/instagram_screen.dart';
// import 'package:direct_whatsapp/modules/sms/open_number_sms.dart';
// import 'package:direct_whatsapp/modules/telegram/telegram_screen.dart';
// import 'package:direct_whatsapp/utils/app_color.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
// import 'custom_icons_icons.dart';
// import 'custom_textfield.dart';
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//   static const routeName = '/myhomepage_screen';
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _currentIndex = 0;
//   @override
//   void initState() {
//     super.initState();
//     controller.pageController = PageController();
//   }
//
//   @override
//   void dispose() {
//     controller.pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         // appBar: AppBar(title: Text("Bottom Nav Bar")),
//         body: SizedBox.expand(
//           child: PageView(
//             controller: controller.pageController,
//             onPageChanged: (index) {
//               setState(() => _currentIndex = index);
//             },
//             children: <Widget>[
//               WhatsApp(),
//               SmsNumber(),
//               Instagram(),
//               Telegram(),
//             ],
//           ),
//         ),
//         // floatingActionButton: FloatingActionButton(
//         //   onPressed: (){},
//         //   child: Icon(Icons.add),
//         //   backgroundColor: Colors.red,
//         // ),
//         // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//         bottomNavigationBar: BottomNavyBar(
//           backgroundColor: AppColors.darkBlue,
//           selectedIndex: _currentIndex,
//           onItemSelected: (index) {
//             setState(() => _currentIndex = index);
//             controller.pageController.jumpToPage(index);
//           },
//           items: <BottomNavyBarItem>[
//             BottomNavyBarItem(
//                 textAlign: TextAlign.center,
//                 title: Text('WhatsApp'.toUpperCase()),
//                 icon: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(6),
//                       gradient: LinearGradient(
//                           begin: Alignment.topRight,
//                           end: Alignment.bottomRight,
//                           colors: [
//                             Color(0xFF5FFC7B),
//                             Color(0xFF28D146),
//                           ]),
//                     ),
//                     child: Padding(
//                       padding:  EdgeInsets.only(  top: 0.1.h,
//                         bottom: 0.3.h,
//                         right: 0.5.w,
//                         left: 0.5.w,),
//                       child: Icon(Icons.whatsapp,
//                       color: AppColors.white,
//                       size: 6.w,
//                       ),
//                     )),
//                 activeColor: AppColor.backgroundColor),
//             BottomNavyBarItem(
//                 textAlign: TextAlign.center,
//                 title: Text('Messages'.toUpperCase()),
//                 icon: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(3),
//                       gradient: LinearGradient(
//                           begin: Alignment.topRight,
//                           end: Alignment.bottomRight,
//                           colors: [
//                             AppColors.white,
//                             AppColors.white,
//                           ]),
//                     ),
//                     child: Padding(
//                       padding:  EdgeInsets.only(  top: 0.2.h,
//                         bottom: 0.1.h,
//                         right: 0.6.w,
//                         left: 0.6.w,),
//                       child: Icon(
//                         Icons.message,
//                         color: AppColors.darkBlue,
//                         size: 6.w,
//                       ),
//                     )),
//                 activeColor: AppColor.backgroundColor),
//             BottomNavyBarItem(
//                 textAlign: TextAlign.center,
//                 title: Text('Instagram'.toUpperCase()),
//                 icon: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       gradient: LinearGradient(
//                           begin: Alignment.topRight,
//                           end: Alignment.bottomRight,
//                           colors: [
//                             Color(0xFF405DE6),
//                             Color(0xFF5851DB),
//                             Color(0xFF833AB4),
//                             Color(0xFFC13584),
//                             Color(0xFFE1306C),
//                             Color(0xFFFD1D1D),
//                             Color(0xFFF56040),
//                             Color(0xFFF77737),
//                             Color(0xFFFCAF45),
//                             Color(0xFFFFDC80),
//                           ]),
//                     ),
//                     child: Padding(
//                       padding:  EdgeInsets.only( top: 0.3.h,
//                         bottom: 0.2.h,
//                         right: 0.5.w,
//                         left: 0.6.w,),
//                       child: Icon(
//                         CustomIcons.instagram,
//                         size: 6.w,
//                       ),
//                     )),
//                 activeColor: AppColor.backgroundColor),
//             BottomNavyBarItem(
//                 textAlign: TextAlign.center,
//                 title: Text('Telegram'.toUpperCase()),
//                 icon: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(6),
//                       gradient: LinearGradient(
//                           begin: Alignment.topRight,
//                           end: Alignment.bottomRight,
//                           colors: [Colors.white, Colors.white]),
//                     ),
//                     child: Padding(
//                       padding:  EdgeInsets.only(    top: 0.1.h,
//                         bottom: 0.1.h,
//                         right: 0.3.w,
//                         left: 0.2.w,),
//                       child: Icon(
//                         Icons.telegram,
//                         color: Colors.blue,
//                         size: 6.2.w,
//                       ),
//                     )),
//                 activeColor: AppColor.backgroundColor),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
