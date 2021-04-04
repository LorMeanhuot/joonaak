// import 'dart:async';
// import 'dart:convert';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:tracking_app_smcc/core/config/config.dart';
// import 'package:tracking_app_smcc/core/model/gps.dart';
// import 'package:tracking_app_smcc/core/model/page.dart';
// import 'package:tracking_app_smcc/core/model/responseError.dart';
// import 'package:tracking_app_smcc/core/model/to-json.dart';
// import 'package:tracking_app_smcc/core/model/user.dart';
// import 'package:tracking_app_smcc/core/model/vehicle-type.dart';
// import 'package:tracking_app_smcc/core/model/vehicle.dart';
// import 'package:tracking_app_smcc/utils/logging-util.dart';
// import 'package:tracking_app_smcc/utils/str-field-util.dart';
// import 'package:http/http.dart' as http;
//
// class API<T extends dynamic> extends ChangeNotifier {
//   final String _baseUrl = appSettings[StrFieldUtil.base_url];
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//
//   Map<String, dynamic> _provider = new Map();
//
//   Future signInPhoneVerifyCode(String verificationId, String smsCode) async {
//     Completer completer = new Completer();
//     AuthCredential authCredential = PhoneAuthProvider.getCredential(
//       verificationId: verificationId,
//       smsCode: smsCode
//     );
//     _signInWithCredential(authCredential, completer);
//     return completer.future;
//   }
//
//   Future singInPhoneVerifyCompleted(AuthCredential authCredential){
//     Completer completer = new Completer();
//     _signInWithCredential(authCredential, completer);
//     return completer.future;
//   }
//
//   void _signInWithCredential(AuthCredential authCredential, Completer completer) async {
//      await FirebaseAuth.instance.signInWithCredential(authCredential).then((result) {
//       completer.complete(result.user);
//     }).catchError((error) {
//       completer.completeError(error);
//     });
//   }
//
//   Future login(User user) async {
//     Completer completer = new Completer();
//     String url = "security/login";
//     var response = await _post(user.toLogin(), url);
//     _completedResult(User(), response, completer);
//     return completer.future;
//   }
//
//   Future addGPS(GPS gps) async {
//     Completer completer = new Completer();
//     String url = "gps";
//     var response = await _post(gps.toJson(), url);
//     _completedResult(GPS(), response, completer);
//     return completer.future;
//   }
//
//   Future getGPS(User user) async {
//     Completer completer = new Completer();
//     String url = "gps/vehicle";
//     var response = await _getParams(user.toCompanyId(), url);
//     _completedResultsList(GPS(), response, completer);
//     return completer.future;
//   }
//
//   Future getVehicles(Page page) async {
//     Completer completer = new Completer();
//     String url = "vehicle/all";
//     var response = await _getParams(page.toVehicle(), url);
//     _completedResultsList(Vehicle(), response, completer);
//     return completer.future;
//   }
//
//   Future getVehiclesType(Page page) async {
//     Completer completer = new Completer();
//     String url = "vehicle_type";
//     var response = await _getParams(page.toVehicleType(), url);
//     _completedResultsMap(VehicleType(), response, completer);
//     return completer.future;
//   }
//
//   Future getUserById(String id) async {
//     Completer completer = new Completer();
//     String url = "user/";
//     var response = await _getParamsRequired({"id": id}, url);
//     _completedResult(User(), response, completer);
//     return completer.future;
//   }
//
//   Future getGPSByDate(Map data) async {
//     Completer completer = new Completer();
//     String url = "gps/vehicle/day";
//     var response = await _getParams(data, url);
//     _completedResultsList(GPS(), response, completer);
//     return completer.future;
//   }
//
//   void _completedResult(ToJson instance, response, Completer completer) {
//     try {
//       ResponseError resError = ResponseError.fromJson(_toMap(response.body));
//       if (resError.message != null && resError.message.isNotEmpty) {
//         completer.completeError(resError);
//       } else {
//         completer.complete(instance.fromJson(_toMap(response.body)));
//       }
//     }catch(e){
//       completer.completeError(e);
//     }
//   }
//
//   void _completedResultsMap(ToJson instance, response, Completer completer) {
//     try {
//       ResponseError resError = ResponseError.fromJson(_toMap(response.body));
//       if (resError.message != null && resError.message.isNotEmpty) {
//         completer.completeError(resError);
//       } else {
//         List<T> data = [];
//         _toMap(response.body)[StrFieldUtil.data].forEach((d) {
//           data.add(instance.fromJson(d));
//         });
//         completer.complete(data);
//       }
//     }catch(e){
//       completer.completeError(e);
//     }
//   }
//
//   void _completedResultsList(ToJson instance, response, Completer completer) {
//     try {
//       List<T> data = [];
//       _toList(response.body).forEach((d) {
//         data.add(instance.fromJson(d));
//       });
//       completer.complete(data);
//     }catch(e){
//       ResponseError resError = ResponseError.fromJson(_toMap(response.body));
//       completer.completeError(resError);
//     }
//   }
//
//   Future<http.Response> _post<T>(Map toJson, String url) async {
//     LoggingUtil.logInfo("postToken: ${_baseUrl + url}", "body: ${_toJson(toJson)}");
//
//     final response = await http.post(
//       _baseUrl + url,
//       headers: Map.from(_header()),
//       body: _toJson(toJson),
//     );
//
//     LoggingUtil.logInfo("result:", response.body);
//     return response;
//   }
//
//   Future<http.Response> _getParams<T>(Map params, String url) async {
//     var baseUrl = _baseUrl.replaceAll("http://", "");
//     var uri = Uri.http(baseUrl.replaceAll("/", ""), "/"+ url, Map.from(params));
//     LoggingUtil.logInfo("getParams: $uri", "$url");
//
//     final response = await http.get(
//       uri,
//       headers: Map.from(_header()),
//     );
//
//     LoggingUtil.logInfo("result:", response.body);
//     return response;
//   }
//
//   Future<http.Response> _getParamsRequired<T>(Map params, String url) async {
//     var baseUrl = _baseUrl.replaceAll("http://", "");
//     var uri = Uri.http(baseUrl.replaceAll("/", ""), "/"+ url, Map.from(params));
//     LoggingUtil.logInfo("getParams: $uri", "$url");
//     var rUrl = uri.toString().replaceAll("?id=", "");
//     final response = await http.get(
//       rUrl,
//       headers: Map.from(_header()),
//     );
//
//     LoggingUtil.logInfo("result:", response.body);
//     return response;
//   }
//
//   void singOut(){
//     firebaseAuth.signOut();
//   }
//
//   void addProvider(String key, data){
//     _provider[key] = data;
//     notifyListeners();
//   }
//
//   T getProvider<T>(String key){
//     return _provider[key];
//   }
//
//   void removeProvider(String key){
//     _provider.remove(key);
//     notifyListeners();
//   }
//
//   Map _header(){
//     return{
//       "content-type": "application/json",
//       "token": appSettings[StrFieldUtil.token_header]
//     };
//   }
//
//   String _toJson(Map toJson){
//     return json.encode(toJson);
//   }
//
//   Map _toMap(toJson){
//     return json.decode(toJson);
//   }
//
//   List _toList(toJson){
//     return json.decode(toJson);
//   }
// }