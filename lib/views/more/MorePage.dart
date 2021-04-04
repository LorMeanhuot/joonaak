// import 'dart:async';
//
// import 'package:driverapp/utils/app_color.dart';
// import 'package:driverapp/utils/app_storage.dart';
// import 'package:driverapp/views/login/login_page.dart';
// import 'package:driverapp/views/notification/notification_page.dart';
// import 'package:driverapp/views/widgets/app_loading.dart';
// import 'package:driverapp/views/widgets/cards/more_card.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class MorePage extends StatefulWidget {
//   @override
//   _MorePageState createState() => _MorePageState();
//
// }
//
//
// class _MorePageState extends State<MorePage> {
//
//   bool _isLoading = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return AppLoading(
//       isLoading: _isLoading,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Mores"),
//           backgroundColor: AppColor.MAIN_COLOR,
//         ),
//         body: Container(
//           child: Column(
//             children: <Widget>[
//               Expanded(
//                 flex: 3,
//                 child: Column(
//                   children: <Widget>[
//                     Container(
//                       alignment: Alignment.topCenter,
//                       child: Image(
//                         image: AssetImage('assets/1-1-2.png'),
//                         height: 110.0,
//                         width: 110.0,
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.only(top: 5, bottom: 5),
//                       child: Text("+85586651443", style: TextStyle( color: Colors.black26, fontSize: 13),),
//                     ),
//                     Text("Chea Vandy", style: TextStyle(color: Colors.black54, fontSize: 15),),
//                   ],
//                 )
//               ),
//               Expanded(
//                 flex: 7,
//                 child: Container(
//                   alignment: Alignment.center,
//                   child: Column(
//                     children: <Widget>[
//                       MoreCard(
//                         title: "Notifications",
//                         icon: Icons.notifications,
//                         onClick: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage())),
//                       ),
//                       MoreCard(
//                         title: "About Us",
//                         icon: Icons.verified_user,
//                         onClick: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage())),
//                       ),
//                       MoreCard(
//                         title: "Settings",
//                         icon: Icons.settings,
//                         onClick: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage())),
//                       ),
//                       MoreCard(
//                         title: "Signout",
//                         icon: Icons.exit_to_app,
//                         onClick: () {
//                           setState(() {
//                             _isLoading = true;
//                           });
//                           AppStorage.clearLogin();
//                           Timer(Duration(seconds: 2), () => setState(() {
//                             _isLoading = false;
//                             Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
//                           }));
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
// }