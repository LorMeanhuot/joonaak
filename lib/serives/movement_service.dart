// import 'dart:convert';
//
// import 'package:driverapp/serives/audit_service.dart';
//
// class MovementService extends AuditService {
//
//   void moved({String message}) async {
//     // api http://express.dev.joonaakhub.com:8889/api/v1/movement
//     var url = "http://express.dev.joonaakhub.com:8889/api/v1/movement";
//
//     Map<String, dynamic> mapBody = {
//       "content" : "$message",
//       "from" : "Driver said"
//     };
//     var headers = <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8'
//     };
//     //await
//     client.post(url, body: jsonEncode(mapBody), headers: headers);
//   }
//
//
//   // void refresCurrentLocation(){
//   //
//   // }
//
// }