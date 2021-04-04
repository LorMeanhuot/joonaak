import 'package:driverapp/utils/app_color.dart';
import 'package:driverapp/utils/delivery_status.dart';
import 'package:driverapp/utils/translator-util.dart';
import 'package:driverapp/views/widgets/app_loading.dart';
import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FailedPopup extends StatefulWidget {
  final Function(String meetOrNot, String reason) failedOnSubmit;

  const FailedPopup({Key key, this.failedOnSubmit}) : super(key: key);
  @override
  _FailedPopupState createState() => _FailedPopupState();
}

class _StatusButton {
  final String title;
  Color color;

  _StatusButton({this.title, this.color});
}

class _StatusButton1 {
  final String title;
  Color color;

  _StatusButton1({this.title, this.color});
}

class _FailedPopupState extends State<FailedPopup> {
  TextEditingController _reason = new TextEditingController();
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  List<_StatusButton1> _list = [
    new _StatusButton1(
      title: TranslatorUtil.text('meet'),
    ),
    new _StatusButton1(
      title: TranslatorUtil.text('notMeet'),
    ),
  ];
  List<_StatusButton> _listButton = [
    new _StatusButton(
      title: TranslatorUtil.text('lostContact'),
    ),
    new _StatusButton(
      title: TranslatorUtil.text('notPickupPhone'),
    ),
    new _StatusButton(
      title: TranslatorUtil.text('wrongSize'),
    ),
    new _StatusButton(
      title: TranslatorUtil.text('wrongItem'),
    ),
    new _StatusButton(
      title: TranslatorUtil.text('wrongColor'),
    ),
  ];
  _StatusButton _selectedItem;
  _StatusButton1 _selectedItem1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AppLoading(
      isLoading: _isLoading,
      child: Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: 520,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      TranslatorUtil.text('failToDelivery'),
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: FDottedLine(
                        width: size.width,
                        color: Colors.black26,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(_list.length, (index) {
                        return ButtonCard1(
                          item: _list[index],
                          height: 70,
                          onClick: () {
                            List<_StatusButton1> tmp = _list;
                            List.generate(tmp.length,
                                (j) => tmp[j].color = Colors.transparent);
                            tmp[index].color = AppColor.red;
                            setState(() {
                              _list = tmp;
                              _selectedItem1 = _list[index];
                            });
                          },
                        );
                      }),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: FDottedLine(
                        width: size.width,
                        color: Colors.black26,
                      )),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    height: 40,
                    width: 250,
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColor.red),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter your reason';
                        }
                        return null;
                      },
                      controller: _reason,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Reason'
                          //hintText: ,
                          ),
                    ),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: Column(
                        children: List.generate(_listButton.length, (index) {
                          return ButtonCard(
                            item: _listButton[index],
                            height: 40,
                            onClick: () {
                              List<_StatusButton> tmp = _listButton;
                              List.generate(tmp.length,
                                  (j) => tmp[j].color = Colors.transparent);
                              tmp[index].color = AppColor.red;
                              setState(() {
                                _listButton = tmp;
                                _selectedItem = _listButton[index];
                                _reason.text = _listButton[index].title;
                              });
                            },
                          );
                        }),
                      )),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        widget.failedOnSubmit(
                            _reason.text, _selectedItem1.title);
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 10),
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [AppColor.red, AppColor.redLight]),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                        child: Text(
                          TranslatorUtil.text('done'),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.WIHTE_COLOR,
                              fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonCard extends StatelessWidget {
  final _StatusButton item;
  final Function() onClick;
  final double height;

  const ButtonCard({Key key, this.item, this.onClick, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: FlatButton(
        height: height,
        onPressed: onClick,
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: AppColor.red, width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(5)),
        color: this.item.color,
        //border: Border.all(width: 1, color: AppColor.red),
        child: Row(
          children: [
            Text(
              item.title,
              style: TextStyle(color: Colors.black45),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonCard1 extends StatelessWidget {
  final _StatusButton1 item;
  final Function() onClick;
  final double height;

  const ButtonCard1({Key key, this.item, this.onClick, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: FlatButton(
        height: height,
        onPressed: onClick,
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: AppColor.red, width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(5)),
        color: this.item.color,
        //border: Border.all(width: 1, color: AppColor.red),
        child: Row(
          children: [
            Text(
              item.title,
              style: TextStyle(color: Colors.black45),
            ),
          ],
        ),
      ),
    );
  }
}
