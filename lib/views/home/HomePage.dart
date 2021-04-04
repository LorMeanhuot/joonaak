import 'package:driverapp/utils/app_color.dart';
import 'package:driverapp/utils/translator-util.dart';
import 'package:driverapp/views/delivery/delivery_page.dart';
import 'package:driverapp/views/express/express_page.dart';
import 'package:driverapp/views/more/more_page.dart';
import 'package:driverapp/views/notification/notification_page.dart';
import 'package:driverapp/views/pickup/pickup_page.dart';
import 'package:driverapp/views/widgets/app_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final tabs = [
      //DeliveryPage(),
      PickupPage(),
      //ExpressPage(),
      //NotificationPage(),
      MorePage(),
    ];
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: Container(
        //color: Colors.transparent,
          child: ClipRRect(
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.MAIN_COLOR,
                // borderRadius: BorderRadius.only(
                //   topLeft: Radius.circular(25),
                //   topRight: Radius.circular(25),
                // ),
              ),
              child: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.directions_bike),
                      //backgroundColor: Color(0xff80C41D),
                      title: Text(TranslatorUtil.text("delivery"))),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.present_to_all),
                      //backgroundColor: Colors.blue,
                      title: Text(TranslatorUtil.text("pickup"))),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.format_list_bulleted),
                      //backgroundColor: Color(0xff80C41D),
                      title: Text(TranslatorUtil.text("more"))
                  ),
                ],
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                currentIndex: _currentIndex,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.black54,
                onTap: onItemTapped,
              ),
            ),
          )),
    );
  }

}
