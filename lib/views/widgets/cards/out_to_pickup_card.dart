import 'package:driverapp/models/pickup_model.dart';
import 'package:driverapp/utils/app_color.dart';
import 'package:driverapp/utils/app_time_date.dart';
import 'package:driverapp/utils/pickup_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class OutToPickupCard extends StatelessWidget {
  final PickupModel item;
  final Function(String type, PickupModel pickup) onClick;
  const OutToPickupCard({Key key, this.item, this.onClick,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        onTap: () => onClick("location", item),
        child: Container(
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
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
                      color: AppColor.MAIN_COLOR.withOpacity(0.6),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => onClick(PickupStatus.ITEM_PICKED_UP, item),
                          child: Container(
                            alignment: Alignment.center,
                            width: 80,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              color: AppColor.MAIN_COLOR.withOpacity(0.6),
                            ),
                            child: Text('Done'),
                          ),
                        ),
                        Divider(thickness: 2, color: Colors.white),
                        InkWell(
                          onTap: () => onClick(PickupStatus.FAIL_TO_PICKUP, item),
                          child: Container(
                            alignment: Alignment.center,
                            width: 80,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              color: AppColor.WARNING_COLOR.withOpacity(0.6),
                            ),
                            child: Text('Fail'),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ),
      );
  }
}