import 'package:driverapp/google_maps_place_picker.dart';
import 'package:driverapp/utils/app_color.dart';
import 'package:driverapp/utils/pick_up_image.dart';
import 'package:driverapp/utils/translator-util.dart';
import 'package:driverapp/views/widgets/app_loading.dart';
import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HalfItemPopup extends StatefulWidget {
  final Function(String dollar, String khmer, String reason) onHalfItemSubmit;

  const HalfItemPopup({Key key, this.onHalfItemSubmit}) : super(key: key);
  @override
  _HalfItemPopupState createState() => _HalfItemPopupState();
}

class _HalfItemPopupState extends State<HalfItemPopup> {
  TextEditingController _controller$ = new TextEditingController();
  TextEditingController _controllerR = new TextEditingController();
  TextEditingController _reason = new TextEditingController();

  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  PickResult selectedPlace;
  final kInitialPosition = LatLng(-33.8567844, 151.213108);
  String apiKeys = "AIzaSyAEg7DFAmrSXUF7kzQLnLUeUWaCVtnBELE";

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
              height: 550,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      TranslatorUtil.text('halfItem'),
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
                            controller: _controller$,
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
                            controller: _controllerR,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                suffixText: 'R',
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
                          TranslatorUtil.text('reason'),
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
                            controller: _reason,
                            decoration: InputDecoration(
                                border: InputBorder.none,
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
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        widget.onHalfItemSubmit(this._controller$.text,
                            this._controllerR.text, this._reason.text);
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
                                  AppColor.GRAY_COLOR,
                                  AppColor.BG_COLOR_GREY
                                ]),
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
