// import 'package:driverapp/utils/app_color.dart';
// import 'package:driverapp/utils/delivery_status.dart';
// import 'package:driverapp/utils/translator-util.dart';
// import 'package:driverapp/views/widgets/app_loading.dart';
// import 'package:fdottedline/fdottedline.dart';
// import 'package:flutter/material.dart';
//
// class ReAppoint extends StatefulWidget {
//   final Function(
//     String recontactDate,
//     String time,
//   ) reappointOnSubmit;
//
//   const ReAppoint({Key key, this.reappointOnSubmit}) : super(key: key);
//
//   @override
//   _ReAppointState createState() => _ReAppointState();
// }
//
// class _ReAppointState extends State<ReAppoint> {
//   bool _isLoading = false;
//   final _formKey = GlobalKey<FormState>();
//   _StatusButton _selectedItem1;
//   _StatusButton _selectedItem2;
//   List<_StatusButton> _list1 = [
//     new _StatusButton(
//       title: TranslatorUtil.text('today'),
//     ),
//     new _StatusButton(
//       title: TranslatorUtil.text('tomorrow'),
//     ),
//   ];
//   List<_StatusButton> _list2 = [
//     new _StatusButton(
// <<<<<<< HEAD
//         title: "9:00 - 10:00", timeFrom: "T9:00:00", timeTo: "T10:00:00"),
//     new _StatusButton(
//         title: "10:00 - 11:00", timeFrom: "T10:00:00", timeTo: "T11:00:00"),
//     new _StatusButton(
//         title: "11:30 - 12:00", timeFrom: "T11:00:00", timeTo: "T12:00:00"),
//     new _StatusButton(
//         title: "1:00 - 2:00", timeFrom: "T13:00:00", timeTo: "T14:00:00"),
//     new _StatusButton(
//         title: "2:00 - 3:00", timeFrom: "T14:00:00", timeTo: "T15:00:00"),
//     new _StatusButton(
//         title: "3:00 - 4:00", timeFrom: "T13:00:00", timeTo: "T14:00:00"),
//     new _StatusButton(
//         title: "4:00 - 5:00", timeFrom: "T16:00:00", timeTo: "T17:00:00"),
//     new _StatusButton(
//         title: "5:00 - 6:00", timeFrom: "T17:00:00", timeTo: "T18:00:00"),
//   ];
//
//   @override
//   void initState() {
//     //TODO
//     DateTime today = new DateTime.now();
//     var d = new DateFormat("yyyy-MM-dd").format(today).toString();
//     setState(() {
//       _appDate = d;
//     });
//     super.initState();
//   }
//
//   @override
// =======
//       title: "9:00 - 10:00",
//     ),
//     new _StatusButton(
//       title: "10:00 - 11:00",
//     ),
//     new _StatusButton(
//       title: "11:30 - 12:00",
//     ),
//     new _StatusButton(
//       title: "1:00 - 2:00",
//     ),
//     new _StatusButton(
//       title: "2:00 - 3:00",
//     ),
//     new _StatusButton(
//       title: "3:00 - 4:00",
//     ),
//     new _StatusButton(
//       title: "4:00 - 5:00",
//     ),
//     new _StatusButton(
//       title: "5:00 - 6:00",
//     ),
//   ];
//
//   @override
// >>>>>>> parent of f6e07e7c3... fix patially paid
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return AppLoading(
//       isLoading: _isLoading,
//       child: Dialog(
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10))),
//         child: Form(
//           key: _formKey,
//           child: Container(
//             height: 510,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   padding: const EdgeInsets.all(12.0),
//                   child: Text(
//                     TranslatorUtil.text('reappointed'),
//                     style: TextStyle(fontSize: 18),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: FDottedLine(
//                       width: size.width,
//                       color: Colors.black26,
//                     )),
//                 Text(TranslatorUtil.text('date')),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: List.generate(_list1.length, (index) {
//                       return ButtonCard(
//                         item: _list1[index],
//                         height: 70,
//                         width: 100,
//                         onClick: () {
//                           List<_StatusButton> tmp = _list1;
//                           List.generate(tmp.length,
//                               (j) => tmp[j].color = Colors.transparent);
//                           tmp[index].color = AppColor.BLUE_COLOR;
//                           setState(() {
//                             _list1 = tmp;
//                             _selectedItem1 = _list1[index];
// <<<<<<< HEAD
// =======
//                             print(_selectedItem1.title);
// >>>>>>> parent of f6e07e7c3... fix patially paid
//                           });
//                         },
//                       );
//                     }),
//                   ),
//                 ),
//                 Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: FDottedLine(
//                       width: size.width,
//                       color: Colors.black26,
//                     )),
//                 Text(TranslatorUtil.text('time')),
//                 Container(
//                   height: 210,
//                   child: GridView.builder(
//                     physics: const NeverScrollableScrollPhysics(),
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         childAspectRatio: 4,
//                         mainAxisSpacing: 10,
//                         crossAxisSpacing: 10,
//                         crossAxisCount: 2),
//                     itemCount: _list2.length,
//                     padding: EdgeInsets.all(20),
//                     itemBuilder: (BuildContext context, int index) {
//                       return ButtonCard(
//                         item: _list2[index],
//                         onClick: () {
//                           List<_StatusButton> tmp = _list2;
//                           List.generate(tmp.length,
//                               (j) => tmp[j].color = Colors.transparent);
//                           tmp[index].color = AppColor.BLUE_COLOR;
//                           setState(() {
//                             _list2 = tmp;
//                             _selectedItem2 = _list2[index];
// <<<<<<< HEAD
// =======
//                             print(_selectedItem2.title);
// >>>>>>> parent of f6e07e7c3... fix patially paid
//                           });
//                         },
//                       );
//                     },
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: GestureDetector(
//                     onTap: () {
//                       widget.reappointOnSubmit(
//                           this._selectedItem1.title, this._selectedItem2.title);
//
//                       Navigator.pop(context);
//                     },
//                     child: Container(
//                       alignment: Alignment.center,
//                       margin: EdgeInsets.only(top: 10),
//                       height: 50,
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                               begin: Alignment.topCenter,
//                               end: Alignment.bottomCenter,
//                               colors: [
//                                 AppColor.BLUE_COLOR,
//                                 AppColor.blueLight
//                               ]),
//                           borderRadius: BorderRadius.only(
//                               bottomRight: Radius.circular(10),
//                               bottomLeft: Radius.circular(10))),
//                       child: Text(
//                         TranslatorUtil.text('done'),
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: AppColor.WIHTE_COLOR,
//                             fontSize: 22),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ButtonCard extends StatelessWidget {
//   final _StatusButton item;
//   final Function() onClick;
//   final double height;
//   final double width;
//
//   const ButtonCard({Key key, this.item, this.onClick, this.height, this.width})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width,
//       child: FlatButton(
//         height: height,
//         onPressed: onClick,
//         shape: RoundedRectangleBorder(
//             side: BorderSide(
//                 color: AppColor.BLUE_COLOR, width: 1, style: BorderStyle.solid),
//             borderRadius: BorderRadius.circular(5)),
//         color: this.item.color,
//         //border: Border.all(width: 1, color: AppColor.red),
//         child: Text(
//           item.title,
//           textAlign: TextAlign.center,
//           style: TextStyle(color: Colors.black45),
//         ),
//       ),
//     );
//   }
// }
//
// class _StatusButton {
//   final String title;
//   Color color;
//
//   _StatusButton({this.title, this.color});
// }
