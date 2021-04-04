import 'package:driverapp/models/notification_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class NotificationCard extends StatelessWidget {


  final NotificationModel item;

  const NotificationCard({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 65,
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.only(bottom: 1),
        color: Colors.grey[100],
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Icon(Icons.notifications, color: Colors.black54,),
            ),
            Expanded(
              flex: 6,
              child: Text(item.description, style: TextStyle(fontSize: 12, color: Colors.black54),),
            ),
          ],
        ),
      )
    );
  }

}