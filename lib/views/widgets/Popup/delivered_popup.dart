import 'package:driverapp/models/delivery_item_model.dart';
import 'package:driverapp/utils/app_color.dart';
import 'package:driverapp/utils/delivery_status.dart';
import 'package:driverapp/utils/map_search/src/models/pick_result.dart';
import 'package:driverapp/utils/map_search/src/place_picker.dart';
import 'package:driverapp/utils/pick_up_image.dart';
import 'package:driverapp/utils/translator-util.dart';
import 'package:driverapp/viewmodels/delivery_view_model.dart';
import 'package:driverapp/views/widgets/Popup/package_transportation_popup.dart';
import 'package:driverapp/views/widgets/app_loading.dart';
import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DeliveredPopup extends StatefulWidget {
  final DeliveryItemModel delivery;
  final Function(String type, String phoneNumber, String taxtFee)
      transferSubmit;
  final Function(
    String collected$,
    String collectedR,
  ) deliveredOnSubmit;
  DeliveryViewModel _viewModel;
  DeliveredPopup(
      {Key key, this.delivery, this.deliveredOnSubmit, this.transferSubmit}) {
    _viewModel = DeliveryViewModel();
  }

  @override
  _DeliveredPopupState createState() => _DeliveredPopupState();
}

class _DeliveredPopupState extends State<DeliveredPopup> {
  //Color _color = AppColor.WIHTE_COLOR;
  TextEditingController _collection$ = new TextEditingController();
  TextEditingController _collectionR = new TextEditingController();
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  PickResult selectedPlace;
  final kInitialPosition = LatLng(-33.8567844, 151.213108);
  String apiKeys = "AIzaSyAEg7DFAmrSXUF7kzQLnLUeUWaCVtnBELE";

  //String price = '${widget.delivery.priceDollar == null || widget.delivery.priceDollar == "" ? "N/A" : widget.delivery.priceDollar}';

  //_StatusButton _selectedItem;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // List<_StatusButton> _list = [
    //   new _StatusButton(
    //     title: '\$ ${widget.delivery.priceDollar == null || widget.delivery.priceDollar == "" ? "N/A" : widget.delivery.priceDollar}',
    //   ),
    //   new _StatusButton(
    //     title: 'R ${widget.delivery.priceRiel == null || widget.delivery.priceRiel == "" ? "N/A" : widget.delivery.priceRiel}',
    //   ),
    // ];
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
              height: 530,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      TranslatorUtil.text('delivered'),
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
                  /*Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(_list.length, (index) {
                        return ButtonCard(
                          item: _list[index],
                          height: 40,
                          onClick: () {
                            List<_StatusButton> tmp = _list;
                            List.generate(tmp.length,
                                    (j) => tmp[j].color = Colors.black54);
                            tmp[index].color = AppColor.MAIN_COLOR.withOpacity(0.8);
                            setState(() {
                              _list = tmp;
                              _selectedItem = _list[index];
                            });
                          },
                        );
                      }),
                    ),
                  ),*/

                  /*Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: FDottedLine(
                      width: size.width,
                      color: Colors.black26,
                    )
                  ),*/
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TranslatorUtil.text('collectionDollar'),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black45),
                            color: AppColor.WIHTE_COLOR,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset:
                                    Offset(3, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: _collection$,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                suffixText: 'USD',
                                suffixStyle:
                                    TextStyle(color: AppColor.MAIN_COLOR)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TranslatorUtil.text('collectionRiel'),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black45),
                            color: AppColor.WIHTE_COLOR,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset:
                                    Offset(3, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: _collectionR,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                suffixText: 'Riel',
                                suffixStyle:
                                    TextStyle(color: AppColor.MAIN_COLOR)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      children: [
                        PickUpImage(
                          height: 60,
                          width: 60,
                          icon: Icons.camera_alt,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            TranslatorUtil.text('transfer'),
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return PlacePicker(
                                    apiKey: apiKeys,
                                    initialPosition: kInitialPosition,
                                    useCurrentLocation: true,
                                    usePlaceDetailSearch: true,
                                    onPlacePicked: (result) {
                                      selectedPlace = result;
                                      Navigator.of(context).pop();
                                      setState(() {});
                                    },
                                    forceSearchOnZoomChanged: true,
                                    automaticallyImplyAppBarLeading: false,
                                    autocompleteLanguage: "kh",
                                    selectInitialPosition: true,
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: new BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                border: Border.all(
                                    width: 1, color: Colors.black45)),
                            child: Icon(
                              Icons.place,
                              color: Colors.black45.withOpacity(0.3),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          width: 180,
                          child: selectedPlace == null
                              ? Container(
                                  child: Text(
                                    TranslatorUtil.text('selectLocation'),
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              : Text(
                                  selectedPlace.formattedAddress ?? "",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PickUpImage(
                          height: 60,
                          width: 60,
                          icon: Icons.home,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            TranslatorUtil.text('locationPhoto'),
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ),
                        InkWell(
                          // onHover: (value){
                          //   setState(() {
                          //     _color = value ? AppColor.WIHTE_COLOR:AppColor.MAIN_COLOR;
                          //   });
                          // },
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (_) => PackageTransportationPopup(
                                      itemModel: widget.delivery,
                                      transferSubmit:
                                          (type, phoneNumber, textFee) {
                                        widget._viewModel.provinceTransfer(
                                          type: type,
                                          phoneNumber: phoneNumber,
                                          busOrTaxiFee: textFee,
                                          id: widget.delivery.id,
                                        );
                                      },
                                    ));
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: new BoxDecoration(
                                color: AppColor.MAIN_COLOR.withOpacity(0.8),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                border: Border.all(
                                    width: 1, color: Colors.black45)),
                            child: Icon(
                              Icons.airport_shuttle,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                          onTap: () {
                            widget.deliveredOnSubmit(
                              this._collection$.text,
                              this._collectionR.text,
                            );
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
                                    colors: [
                                      AppColor.MAIN_COLOR,
                                      AppColor.green
                                    ]),
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                            child: _isLoading
                                ? CupertinoActivityIndicator()
                                : Text(
                                    'DONE',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.WIHTE_COLOR,
                                        fontSize: 22),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
