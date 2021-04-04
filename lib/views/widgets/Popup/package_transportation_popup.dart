import 'package:driverapp/models/delivery_item_model.dart';
import 'package:driverapp/utils/app_color.dart';
import 'package:driverapp/utils/pick_up_image.dart';
import 'package:driverapp/utils/translator-util.dart';
import 'package:driverapp/views/widgets/app_loading.dart';
import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PackageTransportationPopup extends StatefulWidget {
  final Function(
      String type,
      String phoneNumber,
      String taxtFee,
      //String image
      )
      transferSubmit;
  final DeliveryItemModel itemModel;

  const PackageTransportationPopup(
      {Key key, this.transferSubmit, this.itemModel})
      : super(key: key);

  @override
  _PackageTransportationPopupState createState() =>
      _PackageTransportationPopupState();
}

class _PackageTransportationPopupState
    extends State<PackageTransportationPopup> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  _StatusButton1 _selectedItem1;
  _StatusButton2 _selectedItem2;
  TextEditingController _textFee = new TextEditingController();
  TextEditingController _phoneNumber = new TextEditingController();
  List<_StatusButton2> _list2 = [
    new _StatusButton2(
      title: "0R",
    ),
    new _StatusButton2(
      title: "5000R",
    ),
    new _StatusButton2(
      title: "8000R",
    ),
    new _StatusButton2(
      title: "10000R",
    ),
    new _StatusButton2(
      title: "15000R",
    ),
    new _StatusButton2(
      title: "18000R",
    ),
  ];
  List<_StatusButton1> _list1 = [
    new _StatusButton1(
      title: TranslatorUtil.text('taxi'),
    ),
    new _StatusButton1(
      title: TranslatorUtil.text('bus'),
    ),
  ];

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
          child: Container(
            height: 530,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    height: 470,
                    child: CustomScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate([
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                TranslatorUtil.text('packageTransfer'),
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            FDottedLine(
                              width: size.width,
                              color: Colors.black26,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(TranslatorUtil.text('packageCode'),),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 20,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color:
                                          AppColor.GRAY_COLOR.withOpacity(0.5),
                                    ),
                                    child: Text(
                                      '${widget.itemModel.barcode}',
                                      style: TextStyle(
                                          color: AppColor.WIHTE_COLOR,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            FDottedLine(
                              width: size.width,
                              color: Colors.black26,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(_list1.length, (index) {
                                  return ButtonCard1(
                                    item: _list1[index],
                                    height: 60,
                                    width: 70,
                                    onClick: () {
                                      List<_StatusButton1> tmp = _list1;
                                      List.generate(
                                          tmp.length,
                                          (j) => tmp[j].color =
                                              Colors.transparent);
                                      tmp[index].color = AppColor.MAIN_COLOR;
                                      setState(() {
                                        _list1 = tmp;
                                        _selectedItem1 = _list1[index];
                                      });
                                    },
                                  );
                                }),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    TranslatorUtil.text('phone'),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.0),
                                  height: 40,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: AppColor.MAIN_COLOR),
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
                                    controller: _phoneNumber,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: TranslatorUtil.text('fill'),
                                        //hintText: ,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    TranslatorUtil.text('transferFee'),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.0),
                                  height: 40,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: AppColor.MAIN_COLOR),
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
                                    controller: _textFee,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: TranslatorUtil.text('fill'),
                                        //hintText: ,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ]),
                        ),
                        SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  crossAxisCount: 3),
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return ButtonCard2(
                                item: _list2[index],
                                height: 30,
                                onClick: () {
                                  List<_StatusButton2> tmp = _list2;
                                  List.generate(tmp.length,
                                      (j) => tmp[j].color = Colors.transparent);
                                  tmp[index].color = AppColor.MAIN_COLOR;
                                  setState(() {
                                    _list2 = tmp;
                                    _selectedItem2 = _list2[index];
                                    _textFee.text = _list2[index].title;
                                  });
                                },
                              );
                            },
                            childCount: _list2.length,
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildListDelegate([
                            SizedBox(
                              height: 10,
                            ),
                            PickUpImage(
                              height: 90,
                              width: size.width,
                              icon: Icons.camera_alt,
                            ),
                          ]),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 10),
                              height: 50,
                              width: MediaQuery.of(context).size.width / 2.6,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        AppColor.MAIN_COLOR,
                                        AppColor.green
                                      ]),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10))),
                              child: Text(
                                TranslatorUtil.text('cancel'),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.WIHTE_COLOR,
                                    fontSize: 22),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              widget.transferSubmit(
                                _selectedItem1.title,
                                _phoneNumber.text,
                                _textFee.text,
                              );
                              Navigator.pop(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 10),
                              height: 50,
                              width: MediaQuery.of(context).size.width / 2.6,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        AppColor.MAIN_COLOR,
                                        AppColor.green
                                      ]),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                  )),
                              child: Text(
                                TranslatorUtil.text('next'),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.WIHTE_COLOR,
                                    fontSize: 22),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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

class ButtonCard1 extends StatelessWidget {
  final _StatusButton1 item;
  final Function() onClick;
  final double height;
  final double width;

  const ButtonCard1({Key key, this.item, this.onClick, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: FlatButton(
        height: height,
        onPressed: onClick,
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: AppColor.MAIN_COLOR, width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(5)),
        color: this.item.color,
        //border: Border.all(width: 1, color: AppColor.red),
        child: Text(
          item.title,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black45, fontSize: 12),
        ),
      ),
    );
  }
}

class ButtonCard2 extends StatelessWidget {
  final _StatusButton2 item;
  final Function() onClick;
  final double height;
  final double width;

  const ButtonCard2({Key key, this.item, this.onClick, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: FlatButton(
        height: height,
        onPressed: onClick,
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: AppColor.MAIN_COLOR, width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(5)),
        color: this.item.color,
        //border: Border.all(width: 1, color: AppColor.red),
        child: Text(
          item.title,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black45, fontSize: 12),
        ),
      ),
    );
  }
}

class _StatusButton1 {
  final String title;
  Color color;

  _StatusButton1({this.title, this.color});
}

class _StatusButton2 {
  final String title;
  Color color;

  _StatusButton2({this.title, this.color});
}
