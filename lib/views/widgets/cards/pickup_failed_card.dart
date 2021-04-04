import 'package:driverapp/models/pickup_model.dart';
import 'package:driverapp/utils/app_color.dart';
import 'package:driverapp/utils/app_time_date.dart';
import 'package:driverapp/views/pickup/pickup_location_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PickupFailedCard extends StatelessWidget {
  final PickupModel item;

  const PickupFailedCard({Key key, this.item,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 120,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.MAIN_COLOR,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child:
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "${item.name}",
                        style: TextStyle(fontSize: 15, color: Colors.black54),
                      ),
                      Text(
                        "${item.address}",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Text(
                            "${item.phone}",
                            style: TextStyle(fontSize: 11, color: Colors.black54),
                          ),
                          Spacer(),
                          Text(
                            "${item.fromDate != null ? readTimestamp(item.fromDate) : ""}",
                            style: TextStyle(fontSize: 15, color: Colors.black54),
                          ),
                          Text(
                            " - ",
                            style: TextStyle(fontSize: 15, color: Colors.black54),
                          ),
                          Text(
                            "${item.toDate != null ? readTimestamp(item.toDate) : ""}",
                            style: TextStyle(fontSize: 15, color: Colors.black54),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PickupLocationPage(pickup: item))),
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
                      color: AppColor.WARNING_COLOR.withOpacity(0.6),
                    ),
                    child: Icon(
                      Icons.close,
                      color: AppColor.WIHTE_COLOR,
                      size: 30,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      );
  }
}