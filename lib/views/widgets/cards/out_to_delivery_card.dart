import 'package:driverapp/models/delivery_item_model.dart';
import 'package:driverapp/utils/app_color.dart';
import 'package:driverapp/utils/app_time_date.dart';
import 'package:driverapp/utils/delivery_status.dart';
import 'package:driverapp/utils/translator-util.dart';
import 'package:driverapp/views/delivery/delivery_detail_page.dart';

//import 'package:driverapp/views/widgets/cards/payment_card.dart';
import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class OutToDeliveryCard extends StatelessWidget {
  final DeliveryItemModel itemModel;
  final Widget payment;
  final Widget price;

  const OutToDeliveryCard(
      {Key key, this.itemModel, this.payment, this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => new DeliveryDetailPage(
                        price: price,
                        payment: payment,
                        delivery: itemModel,
                        backGroundColor1: AppColor.BLUE_COLOR,
                        backGroundColor2: AppColor.blueLight,
                        title: TranslatorUtil.text("outForDelivery")
                      )));
        },
        child: Container(
          height: 120,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColor.blueLight, AppColor.BLUE_COLOR]),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(3, 3), // changes position of shadow
              ),
            ],
          ),
          child: Container(
            height: 120,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                color: AppColor.WIHTE_COLOR),
            child: Row(
              children: [
                Expanded(
                  flex: 0,
                  child: Padding(
                    padding:
                    const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            border:
                            Border.all(width: 1, color: Colors.black26),
                            borderRadius:
                            BorderRadius.all(Radius.circular(5)),
                          ),
                        ),
                        FDottedLine(
                          dottedLength: 1,
                          color: Colors.black26,
                          height: 78,
                        ),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            border:
                            Border.all(width: 1, color: Colors.black26),
                            borderRadius:
                            BorderRadius.all(Radius.circular(5)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                flex: 3,
                                child: RichText(
                                    overflow: TextOverflow.ellipsis,
                                    text: TextSpan(
                                      text: '${itemModel.customerName == null || itemModel.customerName == "" ? "Receiver Info: " : itemModel.customerName}',
                                      style: TextStyle(color: Colors.black54, fontSize: 12),
                                    )

                                )),
                            Text(
                              '${itemModel.customerPhone}',
                              style: TextStyle(
                                  color: AppColor.MAIN_COLOR,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 5, 5),
                          child: FDottedLine(
                            strokeWidth: 1,
                            dottedLength: 1,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.black26,
                          )),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                      text: "${TranslatorUtil.text("address")}: ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10),
                                      children: [
                                        TextSpan(
                                            text: '${itemModel.address}',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300)),
                                      ]),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                      text: "${TranslatorUtil.text("note")}: ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10),
                                      children: [
                                        TextSpan(
                                            text:
                                            '${itemModel.note == null || itemModel.note == "N/A" ? "N/A" : itemModel.note}',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300)),
                                      ]),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 40,
                                  // decoration: BoxDecoration(
                                  //   border: Border.all(
                                  //       width: 1,
                                  //       color: Colors.black26),
                                  //   borderRadius: BorderRadius.all(
                                  //       Radius.circular(5)),
                                  // ),
                                  child: Icon(
                                    Icons.pin_drop,
                                    color:
                                    AppColor.MAIN_COLOR.withOpacity(0.2),
                                    size: 28,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: SizedBox(),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 5, 5),
                          child: FDottedLine(
                            strokeWidth: 1,
                            dottedLength: 1,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.black26,
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 4,
                              child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                    text: '${itemModel.shopName}',
                                    style: TextStyle(fontSize: 10,color: Colors.black),
                                  )

                              )),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Text('\#${itemModel.barcode}',
                                style: TextStyle(
                                    color: AppColor.MAIN_COLOR,
                                    fontSize: 10)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Column(
                    children: [
                      Container(
                        height: 120,
                        width: 1,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      payment,
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text('Today',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.black12)),
                      ),
                      Text(
                          '${readTimestamp(itemModel.fromDate) == null || readTimestamp(itemModel.fromDate) == '' ? "N/A" : readTimestamp(itemModel.fromDate)}\n${readTimestamp(itemModel.toDate) == null || readTimestamp(itemModel.toDate) == '' ? "N/A" : readTimestamp(itemModel.toDate)}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
