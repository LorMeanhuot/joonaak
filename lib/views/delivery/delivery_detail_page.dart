// import 'package:driverapp/models/delivery_item_model.dart';
// import 'package:driverapp/utils/app_color.dart';
// import 'package:driverapp/utils/app_time_date.dart';
// import 'package:driverapp/utils/delivery_status.dart';
// import 'package:driverapp/utils/translator-util.dart';
// import 'package:driverapp/viewmodels/delivery_view_model.dart';
// import 'package:driverapp/views/widgets/Popup/delivered_popup.dart';
// import 'package:driverapp/views/widgets/Popup/failed_popup.dart';
// import 'package:driverapp/views/widgets/Popup/half_item_popup.dart';
// import 'package:driverapp/views/widgets/Popup/reappoint_popup.dart';
// import 'package:fdottedline/fdottedline.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class TopBar extends StatelessWidget implements PreferredSizeWidget {
//   final Color backGroundColor1, backGroundColor2;
//   final String title;
//   // final Function onMap;
//
//   @override
//   final Size preferredSize;
//
//   TopBar(
//       {@required this.title,
//       this.backGroundColor1,
//       this.backGroundColor2})
//       : preferredSize = Size.fromHeight(80.0);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         // SizedBox(height: 30,),
//         Container(
//           height: 90,
//           width: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                 backGroundColor1,
//                 backGroundColor2,
//               ])),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Container(
//                     alignment: Alignment.center,
//                     height: 40,
//                     width: 40,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                         color: AppColor.WIHTE_COLOR),
//                     child: Icon(Icons.arrow_back),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 15),
//                   child: Text(
//                     title.toUpperCase(),
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                   ),
//                 ),
//                 Container(
//                     alignment: Alignment.center,
//                     height: 40,
//                     width: 40,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                         color: AppColor.WIHTE_COLOR),
//                     child: Icon(Icons.pin_drop))
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class DeliveryDetailPage extends StatefulWidget {
//   final Widget payment;
//   final DeliveryItemModel delivery;
//   final Color backGroundColor1, backGroundColor2;
//   final String title;
//   final Widget price;
//   DeliveryViewModel _viewModel;
//
//   DeliveryDetailPage(
//       {this.backGroundColor1,
//       this.backGroundColor2,
//       this.title,
//       this.delivery,
//       this.payment,
//       this.price}) {
//     _viewModel = DeliveryViewModel();
//   }
//
//   @override
//   _DeliveryDetailPageState createState() => _DeliveryDetailPageState();
// }
//
// class _DeliveryDetailPageState extends State<DeliveryDetailPage> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: TopBar(
//         title: widget.title,
//         backGroundColor2: widget.backGroundColor2,
//         backGroundColor1: widget.backGroundColor1,
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(children: [
//           Card(
//             clipBehavior: Clip.antiAlias,
//             margin: EdgeInsets.all(10),
//             elevation: 2,
//             child: Column(
//               children: [
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                           flex: 4,
//                           child: RichText(
//                             // overflow: TextOverflow.ellipsis,
//                               text: TextSpan(
//                                 text: '${widget.delivery.customerName == null || widget.delivery.customerName == "" ? "Receiver Info: " : widget.delivery.customerName}',
//                                 style: TextStyle(color: Colors.black54, fontSize: 18),
//                               )
//
//                           )),
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.call,
//                             color: AppColor.MAIN_COLOR.withOpacity(0.6),
//                             size: 22,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(right: 5),
//                             child: Text(
//                               '${widget.delivery.customerPhone == null || widget.delivery.customerPhone == "" ? "N/A" : widget.delivery.customerPhone}',
//                               style: TextStyle(
//                                   color: AppColor.MAIN_COLOR.withOpacity(0.6),
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                     child: FDottedLine(
//                       width: size.width,
//                       color: Colors.black12,
//                     )),
//                 Container(
//                   padding: const EdgeInsets.all(20.0),
//                   height: 250,
//                   child: Row(
//                     children: [
//                       Expanded(
//                         flex: 7,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "${TranslatorUtil.text("address")}: ",
//                                   style: TextStyle(
//                                       fontSize: 18, color: Colors.black54),
//                                 ),
//                                 Text(
//                                     '${widget.delivery.address == null || widget.delivery.address == "" ? "N/A" : widget.delivery.address}',
//                                     style: TextStyle(
//                                         fontSize: 18, color: Colors.black54)),
//                               ],
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("${TranslatorUtil.text("note")}: ",
//                                     style: TextStyle(
//                                         fontSize: 16, color: Colors.black54)),
//                                 Text(
//                                     '${widget.delivery.note == null || widget.delivery.note == "" ? "N/A" : widget.delivery.note}',
//                                     style: TextStyle(
//                                         fontSize: 16, color: Colors.black54)),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Text("${TranslatorUtil.text("time")}: ",
//                                     style: TextStyle(
//                                         fontSize: 16, color: Colors.black54)),
//                                 Text(
//                                     '${readTimestamp(widget.delivery.fromDate) == null || readTimestamp(widget.delivery.fromDate) == '' ? "N/A" : readTimestamp(widget.delivery.fromDate)} - '
//                                     '${readTimestamp(widget.delivery.toDate) == null || readTimestamp(widget.delivery.toDate) == '' ? "N/A" : readTimestamp(widget.delivery.toDate)}',
//                                     style: TextStyle(
//                                         fontSize: 16, color: Colors.black54)),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                     child: FDottedLine(
//                       width: size.width,
//                       color: Colors.black12,
//                     )),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                           flex: 4,
//                           child: RichText(
//                               // overflow: TextOverflow.ellipsis,
//                               text: TextSpan(
//                                 text: '${widget.delivery.shopName == null || widget.delivery.shopName == "" ? "N/A" : widget.delivery.shopName}',
//                                 style: TextStyle(color: Colors.black54, fontSize: 18),
//                               )
//
//                           )),
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.call,
//                             color: AppColor.MAIN_COLOR.withOpacity(0.6),
//                             size: 22,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(right: 5),
//                             child: Text(
//                               '${widget.delivery.shopPhone == null || widget.delivery.shopPhone == "" ? "N/A" : widget.delivery.shopPhone}',
//                               style: TextStyle(
//                                   color: AppColor.MAIN_COLOR.withOpacity(0.6),
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         '\#${widget.delivery.barcode == null || widget.delivery.barcode == "" ? "N/A" : widget.delivery.barcode}',
//                         style: TextStyle(
//                             color: AppColor.MAIN_COLOR.withOpacity(0.6),
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       widget.payment,
//                     ],
//                   ),
//                 ),
//                 widget.price,
//               ],
//             ),
//           ),
//           Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//               child: FDottedLine(
//                 width: size.width,
//                 color: Colors.black12,
//               )),
//           Card(
//             margin: EdgeInsets.all(10),
//             clipBehavior: Clip.antiAlias,
//             elevation: 2,
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   widget.delivery.status ==
//                           DeliveryStatus
//                               .OUT_TO_DELIVERY /*&& widget.delivery.isGoing==true*/ ? button(
//                           Icons.refresh, TranslatorUtil.text("reappointed"), AppColor.BLUE_COLOR, () {
//                           showDialog(
//                               context: context, builder: (_) => ReAppoint(
//                             reappointOnSubmit: (recontactDate,time){
//                               widget._viewModel.updateStatus(
//                                 recontactDate: recontactDate,
//                                 expectedDeliveryTimeFrom: time,
//                                 id: widget.delivery.id
//                               );
//                             },
//                           ));
//                         })
//                       : button(Icons.refresh, TranslatorUtil.text("reappointed"),
//                           AppColor.BLUE_COLOR.withOpacity(0.5), null),
//                   widget.delivery.status ==
//                           DeliveryStatus
//                               .OUT_TO_DELIVERY /*&& widget.delivery.isGoing==true*/ ? button(
//                           Icons.flip, TranslatorUtil.text("halfItem"), AppColor.GRAY_COLOR, () {
//                           showDialog(
//                               context: context,
//                               builder: (_) => HalfItemPopup(
//                                 onHalfItemSubmit: (dollar,khmer,reason){
//                                   widget._viewModel.halfItemUpdate(
//                                     collectedDollar: dollar,
//                                     collectedRiel: khmer,
//                                     note: reason,
//                                     id: widget.delivery.id,
//                                   );
//                                 },
//                               ));
//                         })
//                       : button(Icons.flip, TranslatorUtil.text("halfItem"),
//                           AppColor.GRAY_COLOR.withOpacity(0.5), null),
//                   widget.delivery.status ==
//                           DeliveryStatus
//                               .OUT_TO_DELIVERY /*&& widget.delivery.isGoing==true*/ ? button(
//                           Icons.close, TranslatorUtil.text("fail"), AppColor.red, () {
//                           showDialog(
//                               context: context,
//                               builder: (_) => FailedPopup(
//                                     failedOnSubmit: (meetOrNot, reason) {
//                                       widget._viewModel.updateStatus(
//                                           status:
//                                               DeliveryStatus.FAIL_TO_DELIVERY,
//                                           deliveredNote: (meetOrNot + reason),
//                                           id: widget.delivery.id);
//                                     },
//                                   ));
//                         })
//                       : button(Icons.close, TranslatorUtil.text("fail"),
//                           AppColor.red.withOpacity(0.5), null),
//                   widget.delivery.status ==
//                           DeliveryStatus
//                               .OUT_TO_DELIVERY /*&& widget.delivery.isGoing != true*/ ? button(
//                           Icons.done, TranslatorUtil.text("success"), AppColor.MAIN_COLOR, () {
//                           showDialog(
//                               context: context,
//                               builder: (_) => DeliveredPopup(
//                                     delivery: widget.delivery,
//                                     deliveredOnSubmit:
//                                         (collected$, collectedR) {
//                                       widget._viewModel.updateStatus(
//                                           status: DeliveryStatus.ITEM_DELIVERED,
//                                           collectedDollar: collected$,
//                                           collectedRiel: collectedR,
//                                           id: widget.delivery.id);
//                                     },
//                                   ));
//                         })
//                       : button(Icons.done, TranslatorUtil.text("success"),
//                           AppColor.MAIN_COLOR.withOpacity(0.5), null),
//                 ],
//               ),
//             ),
//           )
//         ]),
//       ),
//     );
//   }
//
//   Widget button(
//       IconData icon, String title, Color color, Function onOpenPopup) {
//     return InkWell(
//       onTap: () {
//         onOpenPopup();
//       },
//       child: Container(
//         height: 50,
//         width: 70,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(5)),
//           color: color,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.3),
//               spreadRadius: 3,
//               blurRadius: 5,
//               offset: Offset(3, 3), // changes position of shadow
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               icon,
//               color: AppColor.WIHTE_COLOR,
//               size: 20,
//             ),
//             Text(
//               title,
//               style: TextStyle(
//                 color: AppColor.WIHTE_COLOR,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
