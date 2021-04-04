import 'package:driverapp/models/pickup_model.dart';
import 'package:driverapp/utils/app_color.dart';
import 'package:driverapp/utils/pickup_status.dart';
import 'package:driverapp/utils/translator-util.dart';
import 'package:driverapp/viewmodels/pickup_view_model.dart';
import 'package:driverapp/views/map/merchant_map_page.dart';
import 'package:driverapp/views/pickup/pickup_location_page.dart';
import 'package:driverapp/views/widgets/app_loading.dart';
import 'package:driverapp/views/widgets/app_no_item.dart';
import 'package:driverapp/views/widgets/cards/out_to_pickup_card.dart';
import 'package:driverapp/views/widgets/cards/pickup_assigned_card.dart';
import 'package:driverapp/views/widgets/cards/pickup_done_card.dart';
import 'package:driverapp/views/widgets/cards/pickup_failed_card.dart';
import 'package:driverapp/views/widgets/slide_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class PickupPage extends StatefulWidget {

  @override
  _PickupPageState createState() => _PickupPageState();
}

class _PickupPageState extends State<PickupPage> {

  List<PickupModel> _items = [];
  PickupViewModel _viewModel;
  bool _isLoading = true;

  Future<void> _getPickups() async {
    var tmp = await _viewModel.getPickups();
    setState(() {
      _items = tmp;
      _isLoading = false;
    });
    //return await Future.delayed(Duration(seconds: 1));
    return;
  }

  @override
  void initState() {
    super.initState();
    _viewModel = PickupViewModel();
    _getPickups();
  }

  @override
  Widget build(BuildContext context) {
    return AppLoading(
      isLoading: _isLoading,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.MAIN_COLOR,
            title: Text(TranslatorUtil.text('pickup')),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MerchantMapPage()
                      )
                  );

                },
                icon: Image(
                  image: AssetImage(
                    'assets/icons/map.png',
                  ),
                  height: 20,
                  width: 20,
                  color: AppColor.WIHTE_COLOR,
                ),
              )
            ],

          ),
          body: Container(
            child: _items.length <= 0 ?  AppNoItem()  :  _buildList(),
          )
      ),
    );
  }

  _buildList() {
    return RefreshIndicator(
      onRefresh: _getPickups,
      strokeWidth: 1,
      color: AppColor.MAIN_COLOR,
      backgroundColor: Colors.white.withOpacity(0.9),

      child: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          PickupModel pickup = _items[index];
          return (index == _items.length - 1) ?
          Container(
            margin: EdgeInsets.only(bottom: 5),
            height: 45,
            color: Colors.grey[100],
            child: FlatButton(
              child: Text("More ...", style: TextStyle(fontSize: 12, color: AppColor.MAIN_COLOR),),
              onPressed: () {
                setState(() {

                });
              },
            ),
          ) : _switchCard(pickup);
        },
      ),
    );
  }

  _switchCard(PickupModel pickup){
    switch (pickup.status) {
      case PickupStatus.DRIVER_ASSIGNED:
        return PickupAssignedCard(item: pickup, onClick: _callBack);
      case PickupStatus.OUT_TO_PICKUP:
        return OutToPickupCard(item: pickup, onClick: _callBack);
      case PickupStatus.ITEM_PICKED_UP:
        return PickupDoneCard(
            item: pickup,
            onClickDetail: (data) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PickupLocationPage(pickup: data)));
            }
        );
      case PickupStatus.FAIL_TO_PICKUP:
        return PickupFailedCard(
          item: pickup,
        );
      default:
        return Text("Unknown Status!");
    }
  }

  _callBack(String type, PickupModel pickup) {
    switch (type) {
      case 'location' :
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>
                PickupLocationPage(pickup: pickup))
        );
        break;
      case PickupStatus.OUT_TO_PICKUP:
        _viewModel.updateStatus(
            currentStatus: PickupStatus.OUT_TO_PICKUP, id: pickup.id);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PickupLocationPage(pickup: pickup,)));
        break;
      case PickupStatus.ITEM_PICKED_UP:
        _viewModel.updateStatus(
            currentStatus: PickupStatus.ITEM_PICKED_UP, id: pickup.id);
        break;
      case PickupStatus.FAIL_TO_PICKUP:
        _buildPopup((reason) {
          _viewModel.updateStatus(
              currentStatus: PickupStatus.FAIL_TO_PICKUP,
              id: pickup.id,
              note: reason);
          Navigator.pop(context); // pop the popup dialog aways
        });
        break;
    }
  }

  _buildPopup(Function(String reason) onOk) {
    TextEditingController _reason = new TextEditingController();
    List<String> _listReason = [
      "Lost Contact",
      "Shop Closed",
      "Driver Problem"
    ];

    final _formKey = GlobalKey<FormState>();
    showDialog(
        context: context,
        builder: (BuildContext buildContext) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Form(
              key: _formKey,
              child: Container(
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "DELIVERY FAILED",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Reason",
                        style: TextStyle(fontSize: 16),
                      ),

                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      height: 60,
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 2, color: AppColor.MAIN_COLOR),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
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
                          border: InputBorder.none,
                          //hintText: ,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Row(

                          children: List.generate(_listReason.length, (index) {
                            return Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: FlatButton(
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(5.0)),
                                  padding: EdgeInsets.all(1),
                                  onPressed: () {
                                    _reason.text = _listReason[index];
                                  },
                                  color: AppColor.MAIN_COLOR.withOpacity(0.6),
                                  disabledTextColor:
                                  AppColor.WARNING_COLOR.withOpacity(0.6),
                                  child: Text(
                                    _listReason[index],
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            );
                          })),
                    ),
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
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                          child: SlideAction(
                            text: "Slide to failed",
                            height: 40,

                            sliderButtonIconSize: 20,
                            sliderButtonIconPadding: 5,
                            key: _key,
                            onSubmit: () {
                              if (!_formKey.currentState.validate()) {
                                Future.delayed(
                                  Duration(seconds: 1),
                                  () => _key.currentState.reset(),
                                );
                                return;
                              }
                              onOk(_reason.text);
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
        });
  }
}
