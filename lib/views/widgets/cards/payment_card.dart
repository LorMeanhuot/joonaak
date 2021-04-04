// import 'package:driverapp/models/delivery_item_model.dart';
// import 'package:driverapp/utils/app_color.dart';
// import 'package:flutter/material.dart';
//
// Widget PaidPrice(DeliveryItemModel delivery) {
//   return Container();
// }
//
// Widget CodPrice(DeliveryItemModel delivery) {
//   return Column(
//     children: [
//       Text(
//         '${delivery.priceDollar == null || delivery.priceDollar == "" ? "N/A" : delivery.priceDollar}\$',
//         style: TextStyle(
//           fontSize: 35,
//           color: AppColor.BLUE_COLOR.withOpacity(0.7),
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       Text(
//         '${delivery.priceRiel == null || delivery.priceRiel == "" ? "N/A" : delivery.priceRiel}R',
//         style: TextStyle(
//           fontSize: 25,
//           color: AppColor.BLUE_COLOR.withOpacity(0.7),
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     ],
//   );
// }
//
// Widget PaidPaymentStatus(DeliveryItemModel delivery) {
//   return Container(
//     alignment: Alignment.center,
//     height: 35,
//     width: 50,
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.only(
//           bottomRight: Radius.circular(10),
//           bottomLeft: Radius.circular(10),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.9),
//             spreadRadius: 1,
//             blurRadius: 1,
//             offset: Offset(0, 0), // changes position of shadow
//           ),
//         ],
//         color: Colors.green[600]),
//     child: Text(
//       'PAID',
//       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//     ),
//   );
// }
// <<<<<<< HEAD
//
// Widget defualtPaymentStatus(DeliveryItemModel delivery) {
//   return Container(
//     alignment: Alignment.center,
//     height: 35,
//     width: 50,
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.only(
//           bottomRight: Radius.circular(10),
//           bottomLeft: Radius.circular(10),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.9),
//             spreadRadius: 1,
//             blurRadius: 1,
//             offset: Offset(0, 0), // changes position of shadow
//           ),
//         ],
//         color: Colors.grey[800]),
//     child: Text(
//       delivery.paymentType == 'patiallyPaid' ? 'P/Paid' : delivery.paymentType,
//       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//     ),
//   );
// }
//
// Widget CodPaymentStatus(DeliveryItemModel delivery) {
// =======
// Widget CodPaymentStatus(DeliveryItemModel delivery){
//   print(delivery.priceDollar);
//   print(delivery.priceRiel);
//   print(delivery.customerPhone);
// >>>>>>> parent of f6e07e7c3... fix patially paid
//   return Column(
//     children: [
//       Container(
//         alignment: Alignment.center,
//         margin: EdgeInsets.only(bottom: 5),
//         height: 25,
//         width: 50,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//               bottomRight: Radius.circular(10),
//               bottomLeft: Radius.circular(10),
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.3),
//                 spreadRadius: 2,
//                 blurRadius: 3,
//                 offset: Offset(0, 0), // changes position of shadow
//               ),
//             ],
//             color: AppColor.BLUE_COLOR),
//         child: Text('COD'),
//       ),
//     ],
//   );
// }
//
// Widget CodPayment(DeliveryItemModel delivery) {
//   return Column(
//     children: [
//       Container(
//         alignment: Alignment.center,
//         margin: EdgeInsets.only(bottom: 5),
//         height: 25,
//         width: 50,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//               bottomRight: Radius.circular(10),
//               bottomLeft: Radius.circular(10),
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.3),
//                 spreadRadius: 2,
//                 blurRadius: 3,
//                 offset: Offset(0, 0), // changes position of shadow
//               ),
//             ],
//             color: AppColor.BLUE_COLOR),
//         child: Text('COD'),
//       ),
//       Text(
//           '${delivery.priceDollar == null || delivery.priceDollar == "" ? "N/A" : delivery.priceDollar}\$',
//           style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: AppColor.BLUE_COLOR)),
//     ],
//   );
// }
