import 'package:driverapp/models/pickup_model.dart';
import 'package:driverapp/utils/app_color.dart';
import 'package:driverapp/utils/app_time_date.dart';
import 'package:driverapp/utils/pickup_status.dart';
import 'package:driverapp/utils/translator-util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PickupAssignedCard extends StatelessWidget {
  final PickupModel item;
  final Function(String type, PickupModel pickup) onClick;
  const PickupAssignedCard({Key key, this.item, this.onClick,}) : super(key: key);

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
        child: Slidable(
          enabled: true,
          actionExtentRatio: 0.25,
          actionPane: SlidableBehindActionPane(),
          secondaryActions: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 3),
              decoration: BoxDecoration(
                  color: AppColor.MAIN_COLOR,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
              child: IconSlideAction(
                caption: TranslatorUtil.text('go').toUpperCase(),
                color: Colors.transparent,
                icon: Icons.priority_high,
                onTap: () => onClick(PickupStatus.OUT_TO_PICKUP, item),
              ),
            ),
          ],
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
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
                      color: this.item.status == PickupStatus.DRIVER_ASSIGNED
                          ? AppColor.PENDING_COLOR.withOpacity(0.6)
                          : AppColor.MAIN_COLOR.withOpacity(0.6),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            "${item.itemCount}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 29,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54),
                          ),
                        ),
                        Divider(thickness: 2, color: Colors.white),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            TranslatorUtil.text('assigned'),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      );
  }
}