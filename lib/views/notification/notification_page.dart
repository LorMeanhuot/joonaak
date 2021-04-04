import 'package:driverapp/models/notification_model.dart';
import 'package:driverapp/utils/app_color.dart';
import 'package:driverapp/utils/translator-util.dart';
import 'package:driverapp/views/widgets/app_loading.dart';
import 'package:driverapp/views/widgets/cards/notification_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {

  @override
  _NotificationPageState createState() => _NotificationPageState();

}

class _NotificationPageState extends State<NotificationPage> {

  final List<NotificationModel> notifications = [
    NotificationModel(description: "You get new pickup assigned from Cambodia Shoes"),
    NotificationModel(description: "New item has been added into your delivery list"),
    NotificationModel(description: "Receiver has been change time 2:00 AM"),
    NotificationModel(description: "You get 5 stars from Channa"),
    NotificationModel(description: "You get new pickup assigned from CAM Phone Shop"),
    NotificationModel(description: "You get 4.9 start from ReakSmey"),
    NotificationModel(description: "Hey, New Sheet just assigned"),
    NotificationModel(description: "You get 4.5 stars from Kanika"),


  ];

  @override
  Widget build(BuildContext context) {
    return AppLoading(
      isLoading: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.MAIN_COLOR,
          title: Text(TranslatorUtil.text('notification')),
        ),
        body: ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: NotificationCard(item: notifications[index],)
              );
            }
          )
        //bottomNavigationBar: ,
      ),
    );
  }

}