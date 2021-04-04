// import 'package:driverapp/models/delivery_item_model.dart';
// import 'package:driverapp/utils/app_color.dart';
// import 'package:driverapp/utils/delivery_status.dart';
// import 'package:driverapp/utils/translator-util.dart';
// import 'package:driverapp/viewmodels/delivery_view_model.dart';
// import 'package:driverapp/views/widgets/app_loading.dart';
// import 'package:driverapp/views/widgets/app_no_item.dart';
// import 'package:driverapp/views/widgets/cards/delivery_assigned_card.dart';
// import 'package:driverapp/views/widgets/cards/delivery_done_card.dart';
// import 'package:driverapp/views/widgets/cards/delivery_failed_card.dart';
// import 'package:driverapp/views/widgets/cards/out_to_delivery_card.dart';
// import 'package:driverapp/views/widgets/cards/payment_card.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class DeliveryPage extends StatefulWidget {
//   @override
//   _DeliveryPageState createState() => _DeliveryPageState();
// }
//
// class _DeliveryPageState extends State<DeliveryPage> {
//   List<DeliveryItemModel> _items = [];
//   DeliveryViewModel _deliveryViewModel;
//   bool _isLoading = true;
//
//   Future<void> _getDeliveries() async {
//     var tmp = await _deliveryViewModel.getDeliveries();
//     List<DeliveryItemModel> deliveryItems = [];
//     List.generate(tmp.length, (i) {
//       List.generate(tmp[i].deliveryItems.length, (j) {
//         deliveryItems.add(tmp[i].deliveryItems[j]);
//       });
//     });
//     setState(() {
//       _items = deliveryItems;
//       _isLoading = false;
//     });
//     return;
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _deliveryViewModel = DeliveryViewModel();
//     _getDeliveries();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AppLoading(
//       isLoading: _isLoading,
//       child: Scaffold(
//           appBar: AppBar(
//             elevation: 0,
//             backgroundColor: AppColor.MAIN_COLOR.withOpacity(0.8),
//             title: Text(TranslatorUtil.text("delivery")),
//             actions: [
//               IconButton(
//                 onPressed: () {},
//                 icon: Image(
//                   image: AssetImage(
//                     'assets/icons/map.png',
//                   ),
//                   height: 20,
//                   width: 20,
//                   color: AppColor.WIHTE_COLOR,
//                 ),
//               )
//             ],
//           ),
//           body: Container(
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                   AppColor.MAIN_COLOR.withOpacity(0.8),
//                   AppColor.BACKGROUND_COLOR,
//                 ])),
//             child: _items.length <= 0 ? AppNoItem() : _buildList(),
//           )),
//     );
//   }
//
//   _buildList() {
//     return RefreshIndicator(
//       onRefresh: _getDeliveries,
//       strokeWidth: 1,
//       color: AppColor.MAIN_COLOR,
//       backgroundColor: AppColor.WIHTE_COLOR.withOpacity(0.9),
//       child: ListView.builder(
//         itemCount: _items.length + 1,
//         itemBuilder: (context, index) {
//
//           if(index >= _items.length){
//             return Container(
//               margin: EdgeInsets.only(bottom: 5),
//               height: 45,
//               child: FlatButton(
//                 child: Text(
//                   'More...',
//                   style:
//                   TextStyle(fontSize: 12, color: AppColor.MAIN_COLOR),
//                 ),
//                 onPressed: () {
//                   setState(() {});
//                 },
//               ),
//             );
//           }
//
//           DeliveryItemModel delivery = _items[index];
//           print({'------index------': index});
//           return _switchCard(delivery);
//         },
//       ),
//     );
//   }
//
//   _onGoing({String id}){
//     print({"On going": id});
//     _deliveryViewModel.onGoing(id: id);
//   }
//
//   _switchCard(DeliveryItemModel delivery) {
//     print({">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>:": delivery.isGoing});
//     print({">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>:": delivery.customerPhone});
//     print({">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>:": delivery.id});
//
//     if (delivery.status == DeliveryStatus.OUT_TO_DELIVERY && delivery.isGoing != true) {
//       return DeliveryAssignedCard(
//         itemModel: delivery,
//         onGoing: () => _onGoing(id: delivery.id),
//         payment: _switchPaymentType(delivery),
//         price: _switchPaymentPrice(delivery),
//       );
//     }
//     else if (delivery.status == DeliveryStatus.OUT_TO_DELIVERY &&
//         delivery.isGoing == true) {
//       return OutToDeliveryCard(
//         itemModel: delivery,
//         payment: _switchPaymentType(delivery),
//         price: _switchPaymentPrice(delivery),
//       );
//     }
//     else if (delivery.status == DeliveryStatus.FAIL_TO_DELIVERY) {
//       return DeliveryFailedCard(
//         itemModel: delivery,
//         payment: _switchPaymentType(delivery),
//         price: _switchPaymentPrice(delivery),
//       );
//     }
//     else if (delivery.status == DeliveryStatus.ITEM_DELIVERED) {
//       return DeliveredCard(
//         itemModel: delivery,
//         payment: _switchPaymentType(delivery),
//         price: _switchPaymentPrice(delivery),
//       );
//     } else {
//       return Text('unknown status');
//     }
//   }
//
//
//   _switchPaymentType(DeliveryItemModel delivery) {
//     switch (delivery.paymentType) {
//       case 'cashOnDelivery':
//         return CodPayment(delivery);
//       case 'fullyPaid':
//         return PaidPaymentStatus(delivery);
//       case 'transfer':
//         return PaidPaymentStatus(delivery);
//     }
//   }
//
//   _switchPaymentPrice(DeliveryItemModel delivery) {
//     switch (delivery.paymentType) {
//       case 'cashOnDelivery':
//         return CodPrice(delivery);
//       case 'fullyPaid':
//         return PaidPrice(delivery);
//       case 'transfer':
//         return PaidPrice(delivery);
//     }
//   }
// }
