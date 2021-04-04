import 'package:driverapp/utils/app_color.dart';
import 'package:driverapp/utils/pickup_status.dart';
import 'package:driverapp/utils/translator-util.dart';
import 'package:driverapp/views/widgets/slide_button.dart';
import 'package:flutter/material.dart';

class _StatusButton {
  final String title;
  final String icon;
  Color color;

  _StatusButton({this.title, this.icon, this.color});
}

class Popup extends StatefulWidget {
  final Function(String status) onSubmit;

  const Popup({this.onSubmit});

  @override
  _PopupState createState() => _PopupState();
}

class _PopupState extends State<Popup> {
  final _formKey = GlobalKey<FormState>();

  List<_StatusButton> _listButton = [
    new _StatusButton(
        title: TranslatorUtil.text('assigned'),
        icon: "assets/icons/package.png",
        color: AppColor.MAIN_COLOR.withOpacity(0.6)),
    new _StatusButton(
        title: TranslatorUtil.text('Out to pickup'),
        icon: "assets/icons/delivery-man.png",
        color: AppColor.MAIN_COLOR.withOpacity(0.6)),
    new _StatusButton(
        title: TranslatorUtil.text('Item picked up'),
        icon: "assets/icons/warning.png",
        color: AppColor.MAIN_COLOR.withOpacity(0.6)),
    new _StatusButton(
        title: TranslatorUtil.text('Fail to pickup'),
        icon: "assets/icons/checked.png",
        color: AppColor.MAIN_COLOR.withOpacity(0.6)),
  ];
  _StatusButton _selectedItem;
  bool pressAttention = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Form(
        key: _formKey,
        child: Container(
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  TranslatorUtil.text('editStatus'),
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              Divider(
                height: 2,
                color: Colors.black54,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  TranslatorUtil.text('statusChoose'),
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Column(
                  children: List.generate(_listButton.length, (index) {
                //List<_StatusButton> tmp = _listButton;
                return _StatusButtonCard(
                    item: _listButton[index],
                    onClick: () {
                      List<_StatusButton> tmp = _listButton;
                      List.generate(
                          tmp.length,
                          (j) => tmp[j].color =
                              AppColor.MAIN_COLOR.withOpacity(0.6));
                      tmp[index].color =
                          AppColor.WARNING_COLOR.withOpacity(0.6);
                      setState(() {
                        _listButton = tmp;
                        _selectedItem = _listButton[index];
                      });
                    });
              })),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 2,
                color: Colors.black54,
              ),
              Builder(
                builder: (context) {
                  final GlobalKey<SlideActionState> _key = GlobalKey();
                  //List<_StatusButton> tmp = _listButton;
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                    child: SlideAction(
                      text: "    ${TranslatorUtil.text('yes')}",
                      height: 40,
                      sliderButtonIconSize: 20,
                      sliderButtonIconPadding: 5,
                      key: _key,
                      onSubmit: () {
                        if (this._selectedItem == null) {
                          Future.delayed(
                            Duration(seconds: 1),
                            () => _key.currentState.reset(),
                          );
                          return;
                        }
                        //onOk(_reason.text);
                        widget.onSubmit(this._selectedItem.title);
                        Navigator.pop(context);
                      },
                      innerColor: Colors.white,
                      outerColor: AppColor.MAIN_COLOR.withOpacity(0.6),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusButtonCard extends StatelessWidget {
  final _StatusButton item;
  final Function() onClick;

  _StatusButtonCard({this.item, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: FlatButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0)),
        padding: EdgeInsets.all(1),
        onPressed: this.onClick,
        color: this.item.color,
        disabledTextColor: AppColor.WARNING_COLOR.withOpacity(0.6),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                //'',
                item.icon,
                height: 24,
                width: 24,
              ),
            ),
            Text(
              item.title,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
