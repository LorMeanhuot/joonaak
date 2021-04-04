import 'package:driverapp/models/notification_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class MoreCard extends StatelessWidget {


  final IconData icon;
  final String title;
  final Function onClick;

  const MoreCard({Key key, this.title, this.icon, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      height: 65,
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.only(bottom: 1),
        color: Colors.white,
        child: InkWell(
          onTap: ()=>onClick(),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Icon(icon, color: Colors.black54,),
              ),
              Expanded(
                flex: 6,
                child: Text(title, style: TextStyle(fontSize: 12, color: Colors.black54),),
              ),
            ],
          ),
        )
      )
    );
  }

}